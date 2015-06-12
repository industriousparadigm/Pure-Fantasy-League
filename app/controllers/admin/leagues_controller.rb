class Admin::LeaguesController < AdminController
  inherit_resources
  has_scope :by_season, default: Season.current


  def show
    show! do
      @managers = resource.managers.includes(:user).order(:invitation_token)
    end
  end


  private

    def permitted_params
      params.permit league: [:title, :auction_on]
    end

end
