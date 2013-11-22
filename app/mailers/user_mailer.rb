class UserMailer < ActionMailer::Base
  default from: "railscasts@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign Up Conformation" #set subject here if we don't have to support i18n
  end
end
