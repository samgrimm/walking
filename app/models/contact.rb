class Contact < ApplicationRecord
  validates_presence_of :email, :name, :message
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  after_create :send_notification

  def send_notification
    FeedbackMailer.send_notification(self).deliver
  end
end
