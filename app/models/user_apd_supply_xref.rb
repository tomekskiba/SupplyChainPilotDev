class UserApdSupplyXref < ActiveRecord::Base
  attr_accessible :user_id, :apd_supply_id, :line_max, :units_per_cycle

  belongs_to :apd_supply
  belongs_to :user
end
