class TeamsController < InheritedResources::Base
  include SetBreadcrumbs

  respond_to :html
  before_action :authenticate_user!
  belongs_to :manager

end
