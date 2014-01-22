require 'spec_helper'

describe UserPresenter::Default do
  let(:user) { User.new(email: 'email@example.com', id: -1) }
  let(:presenter) { described_class.new(user, view) }
  subject { presenter }

  describe "#email" do
    it "hides part of email" do
      presenter.email.should == '######@example.com'
    end
  end

  describe "#with_admin_permissions" do
    it "does not execute block" do
      presenter.with_admin_permissions do
        flunk
      end
    end
  end

  describe "#on_myself" do
    it "does not execute block" do
      presenter.on_myself do
        flunk
      end
    end
  end

  its(:delete_link) { should be nil }
  its(:edit_link)   { should be nil }
  its(:self_path) { should include(view.user_path(user)) }
  its(:show_link) { should include(view.user_path(user)) }
end
