class AddNoReservedDaysToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :no_reserved_days, :integer
  end

  def self.down
    remove_column :users, :no_reserved_days
  end
end
