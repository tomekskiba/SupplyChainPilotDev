require 'test_helper'

class AncillarySupplyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AncillarySupply.new.valid?
  end
end
