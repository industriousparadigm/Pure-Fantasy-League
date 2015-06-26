class TeamsController < LeagueController
  include SetBreadcrumbs
  inherit_resources
  skip_before_action :set_team!, if: -> { action_name == 'create' }


  def create
    @team = build_resource
    @team.manager = current_league.managers.find_by(user: current_user)
    create! { :root }
  end


  private

    def permitted_params
      params.permit team: [:title]
    end

    def begin_of_association_chain
      current_league
    end

end
