require 'spec_helper'

describe UserPresenter::Deleted do
  let(:user) { User.new(email: 'email@example.com', id: -1) }
  let(:presenter) { described_class.new(user, view) }
  subject { presenter }

  its(:email) { should == 'ACCOUNT REMOVED' }
  its(:show_link) { should be nil }
end
