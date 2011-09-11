class CreateOrderSolutionXrefs < ActiveRecord::Migration
  def self.up
    create_table :order_solution_xrefs do |t|
      t.integer :order_id
      t.integer :solution_id
      t.integer :on_hand
      t.integer :usage_per_week
      t.timestamps
    end
  end

  def self.down
    drop_table :order_solution_xrefs
  end
end
