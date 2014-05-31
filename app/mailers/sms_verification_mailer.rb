class SmsVerificationMailer < ActionMailer::Base
  default from: "_onebreath"

  def sms_verification_email(user)
    @user = user
    @url = 'http://onebreath.io/users/verify_sms'
    mail(to: @user.sms_address, subject: '')
  end

end