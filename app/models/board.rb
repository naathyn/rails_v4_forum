class Board < ActiveRecord::Base
  belongs_to :category

  has_many :topics, dependent: :delete_all
  has_many :comments, through: :topics

  validates_presence_of :category_id, :description, :name

  def posts
    topics.count + comments.count
  end

  def latest_topic
    topics.first
  end

  def latest_comment
    comments.first
  end

  def latest_post
    if latest_topic.comments.any?
      latest_comment
    else
      latest_topic
    end
  end
end
