class OrderCapdSupplyXref < ActiveRecord::Base
  attr_accessible :order_id, :capd_supply_id, :on_hand

  belongs_to :capd_supply
  belongs_to :order
  has_one :user_capd_supply_xref, :through => :capd_supply

  validates_presence_of :order_id, :on_hand
end
