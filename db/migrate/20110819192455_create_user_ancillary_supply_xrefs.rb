class CreateUserAncillarySupplyXrefs < ActiveRecord::Migration
  def self.up
    create_table :user_ancillary_supply_xrefs do |t|
      t.integer :user_id
      t.integer :ancillary_supply_id
      t.timestamps
    end
  end

  def self.down
    drop_table :user_ancillary_supply_xrefs
  end
end
