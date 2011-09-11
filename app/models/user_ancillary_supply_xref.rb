class UserAncillarySupplyXref < ActiveRecord::Base
  attr_accessible :user_id, :ancillary_supply_id

  belongs_to :ancillary_supply
  belongs_to :user
end
