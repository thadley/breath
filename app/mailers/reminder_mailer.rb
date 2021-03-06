class ReminderMailer < ActionMailer::Base
  default from: "hello@onebreath.io"

  # email templates
  def reminder_email(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_2(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_3(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_4(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: 'Breathe')
  end

  def reminder_email_5(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: ':)')
  end

  def reminder_email_6(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_7(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_8(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_9(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_10(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_11(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: '--')
  end

  def reminder_email_special(email)
    @url = 'http://onebreath.io'
    @instagram = 'instagram://camera'
    mail(to: email, subject: ':)')
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

  def reminder_sms_6(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_7(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_8(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_9(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_10(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_11(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_special(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_test(email)
    @url = 'http://onebreath.io'
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_verizon(email)
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_verizon_2(email)
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_verizon_3(email)
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_verizon_4(email)
    mail(to: email, subject: '', from: '_onebreath')
  end

  def reminder_sms_verizon_5(email)
    mail(to: email, subject: '', from: '_onebreath')
  end
end
