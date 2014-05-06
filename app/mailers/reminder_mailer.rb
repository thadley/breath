class ReminderMailer < ActionMailer::Base
  default from: "support@onebreath.io"

  def reminder_email(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end
end
