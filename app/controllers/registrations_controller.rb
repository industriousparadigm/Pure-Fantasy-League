class RegistrationsController < Devise::RegistrationsController
  # Allow sign up only for the first user who will be admin
  before_action :for_admin_only, only: [ :new, :create ]
  before_action :fetch_invitation, only: [ :respond_invitation, :accept_invitation ]


  def respond_invitation
  end

  def accept_invitation
    if @manager.update invitation_params[:manager]
      sign_in resource_name, @manager.user
      redirect_to :root, notice: t('registrations.invitations.accepted', league: @manager.league)
    else
      render :respond_invitation
    end
  end


  private

    def for_admin_only
      redirect_to :root if User.count > 0
    end

    def fetch_invitation
      redirect_to :root if signed_in?

      @manager = Manager.find_by! invitation_token: invitation_token
      add_breadcrumb @manager.league
      add_breadcrumb 'Accept Invitation'
    rescue ActiveRecord::RecordNotFound
      redirect_to :root, notice: t('registrations.invitations.not_found')
    end

    def invitation_token
      params[:invitation_token] || params[:manager][:invitation_token]
    end

    def invitation_params
      params[:manager][:user_attributes][:id] = @manager.user.id
      params[:manager].merge! invitation_accepted_at: Time.now.utc
      params.permit manager: [
        :invitation_accepted_at, :invitation_token,
        { user_attributes: [:id, :password, :password_confirmation] }
      ]
    end

end
