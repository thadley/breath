class ReminderMailer < ActionMailer::Base
  default from: "trisha.hadley@gmail.com"

  def reminder_email(email)
    @url = 'http://trisha-breath.herokuapp.com'
    mail(to: email, subject: 'Breathe')
  end
end
