class SmsVerificationMailer < ActionMailer::Base
  default from: "trisha.hadley@gmail.com"

  def sms_verification_email(user)
    @user = user
    @url = 'onebreath.io/users/verify_sms'
    mail(to: @user.sms_address, subject: 'Verification code')
  end
end