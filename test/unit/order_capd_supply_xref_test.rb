require 'test_helper'

class OrderCapdSupplyXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert OrderCapdSupplyXref.new.valid?
  end
end
