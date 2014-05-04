class ReminderMailer < ActionMailer::Base
  default from: "support@onebreath.io"

  def reminder_email(email)
    @url = 'onebreath.io'
    mail(to: email, subject: 'Breathe')
  end
end
