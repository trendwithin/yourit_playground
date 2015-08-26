require "test_helper"

class RelatedPostsControllerTest < ActionController::TestCase
  before do
    @user = users(:vic)
  end

  def test_index
    sign_in @user
    get :index
    assert_response :success
  end

end
