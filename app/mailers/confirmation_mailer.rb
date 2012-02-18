class ConfirmationMailer < ActionMailer::Base
  default from: ActionMailer::Base.smtp_settings[:user_name]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.confirm_shuttle.subject
  #
  def confirm_shuttle(user, shuttle)
    @user = user
    @shuttle = shuttle

    mail to: user.email, subject: "Airport Shuttle Confirmation"
  end
end
