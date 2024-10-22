require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe '#welcome_email' do
    it 'sends a welcome email' do
      user = create(:user)
      mailer = double('mailer')

      expect(UserMailer).to receive(:with).with(user: user).and_return(UserMailer)
      expect(UserMailer).to receive(:welcome_email).and_return(mailer)
      expect(mailer).to receive(:deliver_now)
      UserMailer.with(user: user).welcome_email.deliver_now
    end
  end
end
