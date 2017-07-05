class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 128 }
  validates :body, presence: true
  default_scope { order(created_at: :desc) }
  belongs_to :user
end
