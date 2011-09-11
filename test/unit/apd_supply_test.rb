require 'test_helper'

class ApdSupplyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ApdSupply.new.valid?
  end
end
