class UserPresenter::Admin < UserPresenter::Default
  def email
    object.email
  end

  def with_admin_permissions
    yield
  end

  def on_myself
    yield if t.current_user == object
  end

  def edit_link
    t.link_to 'Edit', t.edit_user_path(object)
  end

  def delete_link
    t.link_to 'Delete', t.user_path(object), method: :delete
  end
end
