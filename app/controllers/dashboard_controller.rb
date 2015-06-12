class DashboardController < LeagueController
  skip_before_action :authenticate_user!, if: -> { User.count < 1 }

  def index
    @manager = current_league.managers.find_by(user: current_user)
    if (team = current_league.teams.find_by(manager: @manager)).nil?
      @team = current_league.teams.build(manager: @manager)
    end
  end

end
