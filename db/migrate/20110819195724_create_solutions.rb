class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.decimal :size
      t.string :color
      t.string :solution_type
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
