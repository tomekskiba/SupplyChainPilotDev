class AddSeqNoToSolution < ActiveRecord::Migration
  def self.up
    add_column :solutions, :seq_no, :integer
  end

  def self.down
    remove_column :solutions, :seq_no
  end
end
