class CreateUserSolutionXrefs < ActiveRecord::Migration
  def self.up
    create_table :user_solution_xrefs do |t|
      t.integer :user_id
      t.integer :solution_id
      t.integer :line_max
      t.timestamps
    end
  end

  def self.down
    drop_table :user_solution_xrefs
  end
end
