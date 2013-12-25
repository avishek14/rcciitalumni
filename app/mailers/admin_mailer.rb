class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.feedback.subject
  #
  def feedback name, email, subject, body
    @body = body
    @name = name
    @email = email
    mail to: "rcciit.alumni.admn@gmail.com", subject: "[Feedback] #{subject}"
  end
end
