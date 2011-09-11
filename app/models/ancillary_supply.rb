class AncillarySupply < ActiveRecord::Base
  attr_accessible :name, :picture

  has_many :user_ancillary_supply_xrefs
  has_many :users, :through => :user_ancillary_supply_xrefs

  has_many :order_ancillary_supply_xrefs
  has_many :orders, :through => :order_ancillary_supply_xrefs
end
