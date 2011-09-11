require 'test_helper'

class UserAncillarySupplyXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserAncillarySupplyXref.new.valid?
  end
end
