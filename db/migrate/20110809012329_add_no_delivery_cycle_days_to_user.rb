class AddNoDeliveryCycleDaysToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :no_delivery_cycle_days, :Integer
  end

  def self.down
    remove_column :users, :no_delivery_cycle_days
  end
end
