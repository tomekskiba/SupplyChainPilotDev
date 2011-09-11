require 'test_helper'

class OrderSolutionXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert OrderSolutionXref.new.valid?
  end
end
