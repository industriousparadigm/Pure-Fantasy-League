class DashboardController < LeagueController
  skip_before_action :authenticate_user!, if: -> { User.count < 1 }

  def index
    unless current_team
      manager = current_league.managers.find_by(user: current_user)
      @team = current_league.teams.build(manager: manager)
    end
  end

end
