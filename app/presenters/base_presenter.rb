class BasePresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.for(subject=nil)
    self
  end

  private

  attr_accessor :template, :object

  def t
    @template
  end
end
