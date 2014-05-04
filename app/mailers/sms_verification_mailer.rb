class SmsVerificationMailer < ActionMailer::Base
  default from: "trisha.hadley@gmail.com"

  def sms_verification_email(user)
    @user = user
    @url = 'http://trisha-breath.herokuapp.com'
    mail(to: @user.sms_address, subject: 'Verification code')
  end
end