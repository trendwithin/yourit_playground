class Post < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :body, presence: true

  def tag_list
    tags.map(&:name).join(", ")
  end
end
