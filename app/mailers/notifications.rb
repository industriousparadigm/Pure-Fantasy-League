class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.invite_manager.subject
  #
  def invite_manager(manager)
    @manager = manager
    mail to: manager.user.email, subject: "You've been Invited to play Fantasy Football"
  end
end
