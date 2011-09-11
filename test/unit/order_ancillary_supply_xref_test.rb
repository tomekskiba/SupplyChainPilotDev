require 'test_helper'

class OrderAncillarySupplyXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert OrderAncillarySupplyXref.new.valid?
  end
end
