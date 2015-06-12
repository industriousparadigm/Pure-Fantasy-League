class Admin::ManagersController < AdminController
  inherit_resources
  custom_actions collection: :add_myself
  belongs_to :league


  # Add the current user as a manager of the league
  def add_myself
    @manager = build_resource
    @manager.user = current_user
    @manager.user.new_invitation = true
    @manager.not_invited = true
    @manager.league = parent
    @manager.save!
    redirect_to parent_url, notice: t('flash.managers.myself_added')
  end

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

  def delete_invitation
    resource.destroy!
    redirect_to parent_url, notice: t('flash.managers.delete_invitation.notice', email: interpolation_options[:email])
  end


  private

    def permitted_params
      params.permit manager: { user_attributes: [:name, :email] }
    end

    def interpolation_options
      { email: resource.user.email }
    end

end
