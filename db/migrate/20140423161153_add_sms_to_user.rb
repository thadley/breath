class AddSmsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :integer
    add_column :users, :carrier, :string
    add_column :users, :send_sms, :boolean
    add_column :users, :send_email, :boolean
  end
end
