class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Our root and home breadcrumb
  add_breadcrumb '<i class="fa fa-home"></i>'.html_safe, :root_path

end
