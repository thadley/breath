class SmsVerificationMailer < ActionMailer::Base
  default from: "hello@onebreath.io"

  def sms_verification_email(user)
    @user = user
    @url = 'http://onebreath.io/users/verify_sms'
    mail(to: @user.sms_address, subject: 'Verification code')
  end
end