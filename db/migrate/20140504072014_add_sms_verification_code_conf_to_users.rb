class AddSmsVerificationCodeConfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sms_verification_code_conf, :string
  end
end
