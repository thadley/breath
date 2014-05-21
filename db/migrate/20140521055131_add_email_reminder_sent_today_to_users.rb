class AddEmailReminderSentTodayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_reminder_sent_today, :boolean
  end
end
