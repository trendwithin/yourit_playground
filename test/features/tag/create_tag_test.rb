require "test_helper"

feature "Tag::CreateTag" do
  before do
    @user = users(:vic)
    @shane = users(:shane)
    @post = posts(:one)
  end

    scenario "Logged in User can Create a Post" do
      login @user
      visit new_post_path
      fill_in 'Title', with: @post.title
      fill_in 'Body', with: @post.body
      fill_in 'Tag', with: "vintage, shirt"
      click_button 'Create Post'
      page.must_have_content 'Post was successfully created.'
      page.must_have_content 'vintage, shirt'
    end
end
