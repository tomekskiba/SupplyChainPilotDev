class AddCaregiverLastNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :caregiver_last_name, :string
  end

  def self.down
    remove_column :users, :caregiver_last_name
  end
end
