class Post < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :body, presence: true
  scope :it, -> (p){ joins(:tags).where(tags: {id: p.id}).count }
  scope :tag_roll, -> (u) { joins(:tags).where(tags: {id: u.tags.pluck(&:id).flatten})}
    scope :related_users, -> (u) {joins(:user).where.not(users: { id: u})}

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  # def self.tag_counts
  #   Post.joins(:tags).where(tags: {id: Post.first.tags}).count
  # Post.joins(:tags).joins(:taggings).group("taggings.tag_id").count //similar to sef.tags_count
  # end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
