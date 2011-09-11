class AddJdeReconciliationDateToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :JDE_reconciliation_date, :datetime
  end

  def self.down
    remove_column :users, :JDE_reconciliation_date
  end
end
