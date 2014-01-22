class UserPresenter::Self < UserPresenter::Admin
  def with_admin_permissions(*)
    yield if t.current_user.admin?
  end

  def on_myself
    yield
  end

  def delete_link(*)
    nil
  end
end
