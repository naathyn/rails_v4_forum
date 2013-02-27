class Category < ActiveRecord::Base
  has_many :boards, dependent: :delete_all
  validates_presence_of :name
end
