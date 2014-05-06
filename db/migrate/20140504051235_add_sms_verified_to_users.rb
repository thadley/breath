class AddSmsVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sms_verified, :boolean, :default => false
  end
end
