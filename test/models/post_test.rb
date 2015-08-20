require "test_helper"

class PostTest < ActiveSupport::TestCase

  def post
    @post ||= posts(:one)
  end

  def test_valid
    assert post.valid?
  end

end
