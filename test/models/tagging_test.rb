require "test_helper"

class TaggingTest < ActiveSupport::TestCase

  def tagging
    @tagging ||= taggings(:two)
  end

  def test_valid
    assert tagging.valid?
  end

end
