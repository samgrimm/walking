class FeedbackMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback_mailer.send_notification.subject
  #
  def send_notification(contact)
    @contact = contact
    mail to: "samantha.grimm@gmail.com", subject: "The walking app has received some feedback!"
  end
end
