require "test_helper"

feature "Post::DeletePost" do

  before do
    @user = users(:vic)
    @post = posts(:one)
  end

  scenario "User may delete their own post" do
    login @user
    visit post_path(@post)
    page.must_have_content @post.title
    click_link 'Delete Post'
    save_and_open_page
    page.wont_have_content "Goobye All!"
  end
end
