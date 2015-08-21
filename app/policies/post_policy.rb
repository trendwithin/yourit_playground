class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && user == post.user
  end
  
  private
  def post
    record
  end
end
