class UserPresenter < BasePresenter
  def self.new(object, template)
    return Deleted.new(object, template) if object.deleted?
    return Self.new(object, template) if object.id == template.current_user.try(:id)
    Default.new(object, template)
  end

  def self.for(subject = nil)
    return self if subject.nil?

    if subject.admin?
      Admin
    else
      self
    end
  end
end
