class NewUserMailer < ActionMailer::Base
  default from: 'hello@onebreath.io'

  def new_user_email
    @url = 'http://onebreath.io/admin/users'
    mail(to: 'hello@onebreath.io', subject: 'New user')
  end

end