class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic, touch: true

  validates_presence_of :user_id, :topic_id, :content
end
