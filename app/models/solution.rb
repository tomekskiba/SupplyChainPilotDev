class Solution < ActiveRecord::Base
  attr_accessible :size, :color, :solution_type, :name

  has_many :user_solution_xrefs
  has_many :users, :through => :user_solution_xrefs

  has_many :order_solution_xrefs
  has_many :orders, :through => :order_solution_xrefs

end
