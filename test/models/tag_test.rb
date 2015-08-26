require "test_helper"

class TagTest < ActiveSupport::TestCase

  def tag
    @tag ||= tags(:one)
  end

  def test_valid
    assert tag.valid?
  end
  
end
