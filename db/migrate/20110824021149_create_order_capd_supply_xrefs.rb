class CreateOrderCapdSupplyXrefs < ActiveRecord::Migration
  def self.up
    create_table :order_capd_supply_xrefs do |t|
      t.integer :order_id
      t.integer :capd_supply_id
      t.integer :on_hand
      t.timestamps
    end
  end

  def self.down
    drop_table :order_capd_supply_xrefs
  end
end
