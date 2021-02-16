class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  has_many :groupings
  has_many :groups
  has_one_attached :avatar
  validates :avatar, blob: { content_type: :image }
end
