class CreateApdSupplies < ActiveRecord::Migration
  def self.up
    create_table :apd_supplies do |t|
      t.string :name
      t.string :picture
      t.timestamps
    end
  end

  def self.down
    drop_table :apd_supplies
  end
end
