class AddCaregiverFirstNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :caregiver_first_name, :string
  end

  def self.down
    remove_column :users, :caregiver_first_name
  end
end
