require 'test_helper'

class UserApdSupplyXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserApdSupplyXref.new.valid?
  end
end
