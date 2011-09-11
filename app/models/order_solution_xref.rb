class OrderSolutionXref < ActiveRecord::Base
  attr_accessible :order_id, :solution_id, :on_hand, :usage_per_week

  belongs_to :solution
  belongs_to :order
  has_one :user_solution_xref, :through => :solution

  validates_presence_of :order_id, :solution_id, :on_hand, :usage_per_week
end
