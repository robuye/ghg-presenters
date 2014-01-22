require 'spec_helper'

describe UserPresenter::Admin do
  let(:user) { User.new(email: 'email@example.com', id: -1) }
  let(:presenter) { described_class.new(user, view) }
  subject { presenter }

  its(:email)       { should == user.email }
  its(:edit_link)   { should include(view.edit_user_path(user)) }
  its(:delete_link) { should include(view.user_path(user)) }

  describe "#with_admin_permissions" do
    it "executes block" do
      test_result = false
      presenter.with_admin_permissions { test_result = true }
      test_result.should be true
    end
  end

  describe "#on_myself" do
    it "executes block if presenter wraps current_user" do
      view.stub(:current_user).and_return(user)

      test_result = false
      presenter.on_myself { test_result = true }
      test_result.should be true
    end

    it "does not execute block if presenter wraps other user" do
      view.stub(:current_user)

      presenter.on_myself do
        flunk
      end
    end
  end
end
