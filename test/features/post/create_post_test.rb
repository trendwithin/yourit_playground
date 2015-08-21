require "test_helper"

feature "Post::CreatePost" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password')
    @user.save
    @post = posts(:one)
  end
  scenario "Logged in User can View New Post Page" do
    login @user
    visit new_post_path
    page.must_have_content "New Post"
    page.wont_have_content "Goobye All!"
  end

  scenario "Logged in User can Create a Post" do
    login @user
    visit new_post_path
    fill_in 'Title', with: @post.title
    fill_in 'Body', with: @post.body
    click_button 'Create Post'
    page.must_have_content 'Post was successfully created.'
  end

  scenario 'Logged in User, Malformed Form Data' do
    login @user
    visit new_post_path
    click_button 'Create Post'
    page.must_have_content "Title can't be blank"
    page.must_have_content "Body can't be blank"
  end

  scenario 'New Post Unavailable for Non-Logged-User' do
    visit new_post_path
    page.wont_have_content 'New Post'
    page.must_have_content 'You need to sign in or sign up before continuing.'
  end
end
