require "test_helper"

class PostsControllerTest < ActionController::TestCase

  before do
    @user = users(:vic)
    @post = posts(:one)
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

  def test_user_cant_delete_another_users_post
    sign_out @user
    @shane = users(:shane)
    sign_in @shane
    assert_equal 1, Post.all.count
    refute_difference('Post.count') do
      delete :destroy, id: @post
    end
  end
end
