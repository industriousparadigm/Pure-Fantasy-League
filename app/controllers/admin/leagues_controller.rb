class Admin::LeaguesController < AdminController
  inherit_resources


  def show
    show! do
      @managers = resource.managers.includes(:user).order(:invitation_token)
    end
  end


  private

    def permitted_params
      params.permit league: [:title]
    end

end
