class ChangeDefaultBooleanInSmsVerifiedColumn < ActiveRecord::Migration
  def change
    change_column_default(:users, :sms_verified, false)
  end
end

# redundant change, it was too messy to rollback migrations
