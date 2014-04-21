class ReminderMailer < ActionMailer::Base
  default from: "trisha.hadley@gmail.com"

  def reminder_email(user)
    @user = user
    @url = 'http://trisha-breath.herokuapp.com'
    mail(to: @user.email, subject: 'Reminder')
  end
end
