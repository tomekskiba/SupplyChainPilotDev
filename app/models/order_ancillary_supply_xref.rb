class OrderAncillarySupplyXref < ActiveRecord::Base
  attr_accessible :order_id, :ancillary_supply_id

  belongs_to :ancillary_supply
  belongs_to :order
end
