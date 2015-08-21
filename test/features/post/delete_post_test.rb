require "test_helper"

feature "Post::DeletePost" do

  before do
    @user = users(:vic)
    @shane = users(:shane)
    @post = posts(:one)
  end

  scenario "User may delete their own post" do
    login @user
    visit post_path(@post)
    page.must_have_content @post.title
    click_link 'Delete Post'
    page.wont_have_content "Goobye All!"
    page.wont_have_content @post.title
  end

  scenario 'No Delete Link for Non Post Owner' do
    login @shane
    visit post_path(@post)
    page.wont_have_content 'Delete'
  end
end
