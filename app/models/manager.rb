class Manager < ActiveRecord::Base
  belongs_to :league
  belongs_to :user, dependent: :destroy
  belongs_to :invited_by, polymorphic: true
  has_one :team
  accepts_nested_attributes_for :user

  has_secure_token :invitation_token
  before_create :nullify_invitation_token, if: :not_invited
  after_create :email_invitation
  before_update :nullify_invitation_token, if: -> { invitation_accepted_at_changed?(from: nil) }
  skip_callback :create, :after, :email_invitation, if: :not_invited

  attr_accessor :not_invited


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
      Notifications.invite_manager(self).deliver_now unless not_invited
    end

    def nullify_invitation_token
      self.invitation_token = nil
    end

end
