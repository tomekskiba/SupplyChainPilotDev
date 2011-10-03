class OrderApdSupplyXref < ActiveRecord::Base
  attr_accessible :order_id, :apd_supply_id, :on_hand

  belongs_to :apd_supply
  belongs_to :order
  has_one :user_apd_supply_xref, :through => :apd_supply

  validates_presence_of :order_id, :on_hand
end
