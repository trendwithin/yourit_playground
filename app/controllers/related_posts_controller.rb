class RelatedPostsController < ApplicationController
  def index
    @related_posts = Post.tag_roll(current_user).related_users(current_user)
    authorize @related_posts
  end
end
