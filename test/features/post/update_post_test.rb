require "test_helper"

feature "Post::UpdatePost" do
  before do
    @user = users(:vic)
    @shane = users(:shane)
    @post = posts(:one)
  end
  scenario "User can edit their post" do
    login @user
    visit posts_path
    click_link 'Edit'
    fill_in 'Title', with: 'New Title'
    fill_in 'Body', with: 'New Body'
    click_button 'Update Post'
    page.must_have_content 'New Title'
    page.must_have_content 'New Body'
  end

  scenario 'Edit Not Viewable to Other Users' do
    login @shane
    visit posts_path
    page.wont_have_content 'Edit'
  end
end
