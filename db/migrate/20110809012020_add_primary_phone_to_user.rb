class AddPrimaryPhoneToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :primary_phone, :string
  end

  def self.down
    remove_column :users, :primary_phone
  end
end
