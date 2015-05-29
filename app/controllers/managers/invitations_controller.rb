class Managers::InvitationsController < Devise::InvitationsController

  def resend
    league = League.find(params[:league_id])
    league.managers.find(params[:id]).user.invite!
    redirect_to league_path(params[:league_id])
  end

  def after_invite_path_for(resource)
    league_path params[:league_id]
  end

  private

    def invite_resource
      if (resource = super).errors.empty?
        League.find(params[:league_id]).users << resource
      end
      resource
    end

    def accept_resource
      if (resource = super).errors.empty?
        League.find(params[:league_id]).users << resource
      end
      resource
    end

end