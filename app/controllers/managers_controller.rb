class ManagersController < InheritedResources::Base
  include SetBreadcrumbs

  respond_to :html
  before_action :authenticate_user!, :require_admin!
  belongs_to :league


  def create
    @manager = build_resource
    @manager.invited_by = current_user
    @manager.user.new_invitation = true
    create! { parent }
  end

  def resend_invitation
    resource.resend_invitation!
    redirect_to parent, notice: t('flash.managers.resend_invitation.notice', email: interpolation_options[:email])
  end


  private

    def permitted_params
      params.permit manager: { user_attributes: [:name, :email] }
    end

    def interpolation_options
      { email: resource.user.email }
    end

end
