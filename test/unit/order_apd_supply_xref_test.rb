require 'test_helper'

class OrderApdSupplyXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert OrderApdSupplyXref.new.valid?
  end
end
