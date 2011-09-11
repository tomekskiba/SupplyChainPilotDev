require 'test_helper'

class CapdSupplyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CapdSupply.new.valid?
  end
end
