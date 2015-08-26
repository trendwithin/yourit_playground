require "test_helper"

feature "Post::ShowPost" do
  before do
    @user = User.new(email: 'us@them.com', password: 'password')
    @user.save
    @post = posts(:one)
  end

  scenario "Expecting Show Page to have Title/Body/Tag" do
    login @user
    visit post_path(@post)
    page.must_have_content "My First Post"
    page.must_have_content "One two three four hello"
    page.must_have_content "Nice"
    page.must_have_content "Likes"
  end
end
