require 'spec_helper'

describe UserPresenter do
  describe "self.new" do
    it "returns Deleted presenter for deleted user" do
      described_class.new(User.new(deleted: true), view).
        should be_kind_of(UserPresenter::Deleted)
    end

    it "returns Self presenter for current user" do
      user = User.new
      view.stub(:current_user).and_return(user)

      described_class.new(user, view).
        should be_kind_of(UserPresenter::Self)
    end

    it "returns default presenter" do
      view.stub(:current_user)
      described_class.new(User.new, view).
        should be_kind_of(UserPresenter::Default)
    end
  end

  describe "self.for" do
    it "returns Admin presenter for admin" do
      view.stub(:current_user).and_return(User.new(admin: true))
      described_class.new(User.new, view).
        should be_kind_of(UserPresenter::Admin)
    end

    it "fallback to #new for non-admin" do
      view.stub(:current_user)
      described_class.new(User.new, view).
        should be_kind_of(UserPresenter::Default)
    end
  end
end
