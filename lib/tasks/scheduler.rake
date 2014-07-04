desc "Automatically sends daily reminder" 
# These tasks are called by the Heroku scheduler add-on

# Will send reminder email with different message ~1 time every 144 iterations
# which ~= 1x within 8hrs (at 10 min intervals with 5 different messages)
# won't send another until column is reset (1/day)
# Email content and timing consistent throughout user base (randomization outside of loop)

task email_users: :environment do
    email_number = rand(1..240)
      User.all.each do |user|
      if user.send_email && user.confirmed_at && (email_number == 1) && !user.email_reminder_sent_today
        ReminderMailer.reminder_email(user.email).deliver!
        user.update_column(:email_reminder_sent_today, true)
      elsif user.send_email && user.confirmed_at && (email_number == 2) && !user.email_reminder_sent_today
        ReminderMailer.reminder_email_2(user.email).deliver!
        user.update_column(:email_reminder_sent_today, true)
      elsif user.send_email && user.confirmed_at && (email_number == 3) && !user.email_reminder_sent_today
        ReminderMailer.reminder_email_3(user.email).deliver!
        user.update_column(:email_reminder_sent_today, true)
      elsif user.send_email && user.confirmed_at && (email_number == 4) && !user.email_reminder_sent_today
        ReminderMailer.reminder_email_4(user.email).deliver!
        user.update_column(:email_reminder_sent_today, true)
      elsif user.send_email && user.confirmed_at && (email_number == 5) && !user.email_reminder_sent_today
        ReminderMailer.reminder_email_5(user.email).deliver!
        user.update_column(:email_reminder_sent_today, true)
      end
    end  
end


# Reset email reminder column daily

task reset_email_column: :environment do
  User.all.each do |user|
    user.update_column(:email_reminder_sent_today, false)
  end
end


# Will send sms reminder with different message ~1 time every 144 iterations
# which ~= 1x within 8hrs (at 10 min intervals with 5 different messages)
# won't send another until column is reset (1/day)
# will send final sms if one has not been sent by reasonable time (~7-8p)
# Sms content and timing consistent throughout user base (randomization outside of loop)

task sms_users: :environment do
    sms_number = rand(1..240)
      User.all.each do |user|
      if user.send_sms && user.sms_verified  && (sms_number == 1) && !user.sms_reminder_sent_today
        ReminderMailer.reminder_sms(user.sms_address).deliver!
        user.update_column(:sms_reminder_sent_today, true)
      elsif user.send_sms && user.sms_verified  && (sms_number == 2) && !user.sms_reminder_sent_today
        ReminderMailer.reminder_sms_2(user.sms_address).deliver!
        user.update_column(:sms_reminder_sent_today, true)
      elsif user.send_sms && user.sms_verified  && (sms_number == 3) && !user.sms_reminder_sent_today
        ReminderMailer.reminder_sms_3(user.sms_address).deliver!
        user.update_column(:sms_reminder_sent_today, true)
      elsif user.send_sms && user.sms_verified  && (sms_number == 4) && !user.sms_reminder_sent_today
        ReminderMailer.reminder_sms_4(user.sms_address).deliver!
        user.update_column(:sms_reminder_sent_today, true)
      elsif user.send_sms && user.sms_verified  && (sms_number == 5) && !user.sms_reminder_sent_today
        ReminderMailer.reminder_sms_5(user.sms_address).deliver!
        user.update_column(:sms_reminder_sent_today, true)
      end
    end  
end


# If users have not received daily sms reminder, this task will send one.

task sms_users_final: :environment do
  User.all.each do |user|
    if user.send_sms && user.sms_verified && !user.sms_reminder_sent_today
     ReminderMailer.reminder_sms(user.sms_address).deliver!
     user.update_column(:sms_reminder_sent_today, true)
    end
  end
end


# Reset sms reminder column daily

task reset_sms_column: :environment do
  User.all.each do |user|
    user.update_column(:sms_reminder_sent_today, false)
  end
end


# Special July 4 message

task sms_users_special: :environment do
  User.all.each do |user|
    if user.send_sms && user.sms_verified && !user.sms_reminder_sent_today
     ReminderMailer.reminder_sms_special(user.sms_address).deliver!
     user.update_column(:sms_reminder_sent_today, true)
    end
  end
end

task email_users_special: :environment do
  User.all.each do |user|
    if user.send_email && user.confirmed_at && !user.email_reminder_sent_today
     ReminderMailer.reminder_email_special(user.email).deliver!
     user.update_column(:email_reminder_sent_today, true)
    end
  end
end
