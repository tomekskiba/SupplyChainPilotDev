class AddSuppliesCountedAtToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :supplies_counted_at, :datetime
  end

  def self.down
    remove_column :orders, :supplies_counted_at
  end
end
