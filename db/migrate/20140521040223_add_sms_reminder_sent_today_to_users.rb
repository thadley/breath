class AddSmsReminderSentTodayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sms_reminder_sent_today, :boolean
  end
end
