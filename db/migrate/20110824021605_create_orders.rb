class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.boolean :submitted_flag
      t.boolean :opt_in
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
