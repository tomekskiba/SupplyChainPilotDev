class CreateOrderAncillarySupplyXrefs < ActiveRecord::Migration
  def self.up
    create_table :order_ancillary_supply_xrefs do |t|
      t.integer :order_id
      t.integer :ancillary_supply_id
      t.timestamps
    end
  end

  def self.down
    drop_table :order_ancillary_supply_xrefs
  end
end
