class AddDeliveryDateToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :delivery_date, :datetime
  end

  def self.down
    remove_column :users, :delivery_date
  end
end
