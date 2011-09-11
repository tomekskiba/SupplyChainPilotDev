class CapdSupply < ActiveRecord::Base
  attr_accessible :name, :picture

  has_many :user_capd_supply_xrefs
  has_many :users, :through => :user_capd_supply_xrefs

  has_many :order_capd_supply_xrefs
  has_many :orders, :through => :order_capd_supply_xrefs
end
