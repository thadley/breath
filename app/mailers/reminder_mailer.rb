class ReminderMailer < ActionMailer::Base
  default from: "support@onebreath.io"

  def reminder_email(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_2(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Yes')
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
    mail(to: email, subject: ':)')
  end

    def reminder_email_6(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_7(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Why yes')
  end

  def reminder_email_8(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: ':)')
  end
end
