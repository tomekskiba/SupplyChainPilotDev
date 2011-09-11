require 'test_helper'

class UserSolutionXrefTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserSolutionXref.new.valid?
  end
end
