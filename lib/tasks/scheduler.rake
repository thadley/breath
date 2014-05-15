desc "Automatically sends daily reminder"

# Will send reminder email with different message ~1 time every 144 iterations
# which ~= 1x/day (at 10 min intervals with 5 different messages)

task email_users: :environment do
      User.all.each do |user|
      if user.send_email && 
        if rand(1..720) == 1
          ReminderMailer.reminder_email(user.email).deliver!
        elsif rand(1..720) == 2
          ReminderMailer.reminder_email_2(user.email).deliver!
        elsif rand(1..720) == 3
          ReminderMailer.reminder_email_3(user.email).deliver!
        elsif rand(1..720) == 4
          ReminderMailer.reminder_email_4(user.email).deliver!
        elsif rand(1..720) == 5
          ReminderMailer.reminder_email_5(user.email).deliver!
        end
      end
    end
end


# Will send sms reminder with different message ~1 out of every 5 times
# which ~= 1x/day (with 5 separate tasks each called once per day)

task sms_users: :environment do
    User.all.each do |user|
      if user.send_sms && user.sms_verified && (rand(1..5) == 1)
       ReminderMailer.reminder_email(user.sms_address).deliver!
      end
    end
end

task sms_users_2: :environment do
    User.all.each do |user|
      if user.send_sms && user.sms_verified && (rand(1..5) == 2)
       ReminderMailer.reminder_email_2(user.sms_address).deliver!
      end
    end
end

task sms_users_3: :environment do
    User.all.each do |user|
      if user.send_sms && user.sms_verified && (rand(1..5) == 3)
       ReminderMailer.reminder_email_3(user.sms_address).deliver!
      end
    end
end

task sms_users_4: :environment do
    User.all.each do |user|
      if user.send_sms && user.sms_verified && (rand(1..5) == 4)
       ReminderMailer.reminder_email_4(user.sms_address).deliver!
      end
    end
end

task sms_users_5: :environment do
    User.all.each do |user|
      if user.send_sms && user.sms_verified && (rand(1..5) == 5)
       ReminderMailer.reminder_email_5(user.sms_address).deliver!
      end
    end
end
