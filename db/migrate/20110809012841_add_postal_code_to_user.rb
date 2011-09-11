class AddPostalCodeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :postal_code, :string
  end

  def self.down
    remove_column :users, :postal_code
  end
end
