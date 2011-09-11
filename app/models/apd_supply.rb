class ApdSupply < ActiveRecord::Base
  attr_accessible :name, :picture

  has_many :user_apd_supply_xrefs
  has_many :users, :through => :user_apd_supply_xrefs

  has_many :order_apd_supply_xrefs
  has_many :orders, :through => :order_apd_supply_xrefs
end
