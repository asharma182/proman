class UserMailer < ActionMailer::Base
   include Devise::Mailers::Helpers
  default from: "railscasts@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user =user

    mail to: user.email, :subject => 'Sign up Confirmation'
  end
  def confirmation_instructions(record)
    devise_mail(record, :confirmation_instructions)
  end

  def reset_password_instructions(record)
    devise_mail(record, :reset_password_instructions)
  end

end
