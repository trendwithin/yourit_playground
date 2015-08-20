require "test_helper"

class PostsControllerTest < ActionController::TestCase

  before do
    @user = users(:vic)
  end

  def test_index
    get :index
    assert_response :success
  end

  def test_new
    sign_in @user
    get :new
    assert_response :success
  end
end
