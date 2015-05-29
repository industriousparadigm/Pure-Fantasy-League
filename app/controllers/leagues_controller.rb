class LeaguesController < InheritedResources::Base
  include SetBreadcrumbs

  respond_to :html
  before_action :authenticate_user!, :require_admin!


  private

    def permitted_params
      params.permit league: [:title]
    end

end
