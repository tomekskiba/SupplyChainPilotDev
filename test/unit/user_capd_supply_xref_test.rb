require 'test_helper'

class UserCapdSupplyXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserCapdSupplyXref.new.valid?
  end
end
