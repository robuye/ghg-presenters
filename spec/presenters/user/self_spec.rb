require 'spec_helper'

describe UserPresenter::Self do
  let(:user) { User.new(email: 'email@example.com', id: -1) }
  let(:presenter) { described_class.new(user, view) }
  subject { presenter }

  describe "#with_admin_permissions" do
    it "executes block if current_user is admin" do
      view.stub(:current_user).and_return(double(User, admin?: true))

      test_result = false
      presenter.with_admin_permissions { test_result = true }
      test_result.should be true
    end

    it "doesn't execute block if current_user is not admin" do
      view.stub(:current_user).and_return(double(User, admin?: false))

      presenter.with_admin_permissions do
        flunk
      end
    end

    its(:delete_link) { should be nil }
  end
end
