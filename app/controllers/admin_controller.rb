class AdminController < ApplicationController
  before_action :authenticate_user!, :require_admin!
  respond_to :html

  # Breadcrumbs
  add_breadcrumb 'Admin', :admin_path
  include SetBreadcrumbs

end
