class AddCaregiverPhoneToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :caregiver_phone, :string
  end

  def self.down
    remove_column :users, :caregiver_phone
  end
end
