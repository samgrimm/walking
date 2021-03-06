require "rails_helper"

RSpec.describe FeedbackMailerMailer, type: :mailer do
  describe "send_notification" do
    let(:mail) { FeedbackMailerMailer.send_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Send notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
