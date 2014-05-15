class ReminderMailer < ActionMailer::Base
  default from: "support@onebreath.io"

  def reminder_email(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_2(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_3(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_4(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_5(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end
end
