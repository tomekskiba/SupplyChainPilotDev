class AddMobilePhoneToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :mobile_phone, :string
  end

  def self.down
    remove_column :users, :mobile_phone
  end
end
