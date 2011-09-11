class OrderApdSupplyXref < ActiveRecord::Base
  attr_accessible :order_id, :apd_supply_id, :on_hand

  belongs_to :apd_supply
  belongs_to :order
  has_one :user_apd_supply_xref, :through => :apd_supply

  validates_presence_of :order_id, :on_hand

#after_validation :a_method_used_for_validation_purposes
 # def a_method_used_for_validation_purposes
  #  #errors.add("Solutions3", " on Hand cannot be blank")
   # logger.info("baseapdXXXXXXXXXXXXXXXXXXXXXXXXX")
    #  errors.each {
     #   |attr, msg|
#     logger.info("2errtermsXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+attr.to_s+msg)
 #   }
  #  order.errors.add_to_base(" on Hand cannot be blank")
   # order.errors.add("aa","aaaaaaaaaaaaaaaaa")
#  end
end
