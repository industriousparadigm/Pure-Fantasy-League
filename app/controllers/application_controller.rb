class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin_scope?
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do |e|
    render file: 'public/401.html', status: 401, layout: false
  end

  # Our root and home breadcrumb
  add_breadcrumb '<i class="fa fa-home"></i>'.html_safe, :root_path


  # Assists with scoping admin paths when not using InheritedResources URL helpers.
  def admin_scope
    if controller_name == 'admin' || self.class.name.deconstantize == 'Admin'
      :admin
    else
      nil
    end
  end

  def admin_scope?
    !admin_scope.nil?
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end

    def require_admin!
      unless current_user.admin?
        raise Pundit::NotAuthorizedError.new(query: :access, record: self.class.name)
      end
    end

end
