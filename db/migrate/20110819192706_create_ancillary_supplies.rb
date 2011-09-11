class CreateAncillarySupplies < ActiveRecord::Migration
  def self.up
    create_table :ancillary_supplies do |t|
      t.string :name
      t.string :picture
      t.timestamps
    end
  end

  def self.down
    drop_table :ancillary_supplies
  end
end
