require "test_helper"

feature "Link::LinkTest" do
  before do
    @user = users(:vic)
  end
  scenario "HomePage Links" do
    visit root_path
    page.must_have_content 'Home'
    page.must_have_content 'Post'
    page.must_have_content 'Related Post'
    page.must_have_content 'Tag Cloud'
  end

  scenario 'Click Post' do
    visit root_path
    click_link 'Post'
    page.must_have_content 'Posts'
  end

  scenario 'Click Home Page From Post' do
    visit posts_path
    click_link 'Home'
    page.must_have_content 'Welcome'
  end
end
