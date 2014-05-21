class ReminderMailer < ActionMailer::Base
  default from: "hello@onebreath.io"

  # email templates
  def reminder_email(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_2(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '--')
  end

  def reminder_email_3(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '--')
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
    mail(to: email, subject: '--')
  end

  def reminder_email_7(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '--')
  end

  def reminder_email_8(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '--')
  end

  def reminder_email_9(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '--')
  end

  # SMS templates (no subject)
  def reminder_sms(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_2(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_3(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_4(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_5(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end
end
