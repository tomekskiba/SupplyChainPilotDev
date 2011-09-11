class AddCaregiverEmailToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :caregiver_email, :string
  end

  def self.down
    remove_column :users, :caregiver_email
  end
end
