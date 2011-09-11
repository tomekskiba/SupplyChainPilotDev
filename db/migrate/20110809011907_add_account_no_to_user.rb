class AddAccountNoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :account_no, :string
  end

  def self.down
    remove_column :users, :account_no
  end
end
