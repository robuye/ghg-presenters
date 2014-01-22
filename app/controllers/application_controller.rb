class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def present(object, klass=nil)
    klass ||= "#{object.class}Presenter".demodulize.constantize
    obj = klass.for(current_user).new(object, view_context)
    block_given? ? yield(obj) : obj
  end

  helper_method :present
end
