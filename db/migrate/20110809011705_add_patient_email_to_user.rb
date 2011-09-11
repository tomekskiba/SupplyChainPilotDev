class AddPatientEmailToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :patient_email, :string
  end

  def self.down
    remove_column :users, :patient_email
  end
end
