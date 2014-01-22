class UserPresenter::Deleted < UserPresenter::Default
  def email
    "ACCOUNT REMOVED"
  end

  def show_link
    nil
  end
end
