class Comment < ApplicationRecord
  validates :description, presence: true, length: { minimum: 4, maximum: 140 }
  belongs_to :user
  belongs_to :project
  validates :user_id, presence: true
  validates :project_id, presence: true
  default_scope -> { order(updated_at: :desc)}
  
end