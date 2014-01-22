class UserPresenter::Default < BasePresenter
  delegate :id, :created_at, :admin?, :deleted?,
    :deleted, :admin, to: :object

  def email
    object.email.gsub(/.{0,6}@/, '######@')
  end

  def with_admin_permissions
    nil
  end

  def on_myself
    nil
  end

  def self_path
    t.user_path(object)
  end

  def delete_link
    nil
  end

  def edit_link
    nil
  end

  def show_link
    t.link_to('Show', self_path)
  end
end
