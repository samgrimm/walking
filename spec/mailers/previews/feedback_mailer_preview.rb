# Preview all emails at http://localhost:3000/rails/mailers/feedback_mailer
class FeedbackMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/feedback_mailer/send_notification
  def send_notification
    FeedbackMailerMailer.send_notification
  end

end
