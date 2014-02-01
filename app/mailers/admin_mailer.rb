class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.feedback.subject
  #

  def user_active user
    mail to: user.email, subject: "Your account on www.rcciitalumni.in has been activated!"
  end

  def user_deactive user
    mail to: user.email, subject: "Your account on www.rcciitalumni.in has been deactivated!"
  end
end
