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