class Admin::ManagersController < AdminController
  inherit_resources
  belongs_to :league


  def create
    @manager = build_resource
    @manager.invited_by = current_user
    @manager.user.new_invitation = true
    create! { parent_url }
  end

  def resend_invitation
    resource.resend_invitation!
    redirect_to parent_url, notice: t('flash.managers.resend_invitation.notice', email: interpolation_options[:email])
  end


  private

    def permitted_params
      params.permit manager: { user_attributes: [:name, :email] }
    end

    def interpolation_options
      { email: resource.user.email }
    end

end
