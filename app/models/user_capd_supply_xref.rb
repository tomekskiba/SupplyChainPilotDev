class UserCapdSupplyXref < ActiveRecord::Base
  attr_accessible :user_id, :capd_supply_id, :line_max, :units_per_cycle

  belongs_to :capd_supply
  belongs_to :user
end
