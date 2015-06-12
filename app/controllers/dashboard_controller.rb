class DashboardController < LeagueController
  skip_before_action :authenticate_user!, if: -> { User.count < 1 }

  def index

  end

end
