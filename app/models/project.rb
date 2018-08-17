class Project < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: true
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy
end