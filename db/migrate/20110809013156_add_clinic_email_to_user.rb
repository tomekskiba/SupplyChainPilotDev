class AddClinicEmailToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :clinic_email, :string
  end

  def self.down
    remove_column :users, :clinic_email
  end
end
