desc "Automatically sends daily reminder"
task email_users: :environment do
    User.all.each do |user|
      if user.send_email
       ReminderMailer.reminder_email(user.email).deliver!
      end
    end
end

task sms_users: :environment do
    User.all.each do |user|
      if user.send_sms
       ReminderMailer.reminder_email(user.sms_address).deliver!
      end
    end
end