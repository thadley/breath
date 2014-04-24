desc "Automatically sends daily email reminder"
task email_users: :environment do
    User.all.each do |user|
      if user.send_email
       ReminderMailer.reminder_email(user.email).deliver!
      end
      if user.send_sms
       ReminderMailer.reminder_email(user.sms_address).deliver!
      end
    end
end

# Custom rake task, works with whenever gem (schedule.rb) in development
# :environment is a dependency (will be run first) that loads the 
# environment to have access to models, classes, etc. (here, users)
# http://railscasts.com/episodes/66-custom-rake-tasks