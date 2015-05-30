class Manager < ActiveRecord::Base
  belongs_to :league
  belongs_to :user
  belongs_to :invited_by, polymorphic: true
  accepts_nested_attributes_for :user
  after_create :email_invitation
  before_update :nullify_invitation_token
  has_secure_token :invitation_token

  default_scope { where invitation_token: nil }


  def to_s
    user.to_s
  end

  def resend_invitation!
    email_invitation
  end

  def pending_invitation?
    invitation_token
  end


  private

    def email_invitation
      Notifications.invite_manager(self).deliver_now if invitation_token
    end

    def nullify_invitation_token
      self.invitation_token = nil if invitation_accepted_at_changed?(from: nil)
    end

end
