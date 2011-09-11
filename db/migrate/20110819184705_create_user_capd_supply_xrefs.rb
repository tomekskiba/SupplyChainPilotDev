class CreateUserCapdSupplyXrefs < ActiveRecord::Migration
  def self.up
    create_table :user_capd_supply_xrefs do |t|
      t.integer :user_id
      t.integer :capd_supply_id
      t.integer :line_max
      t.integer :units_per_cycle
      t.timestamps
    end
  end

  def self.down
    drop_table :user_capd_supply_xrefs
  end
end
