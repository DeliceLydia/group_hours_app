class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  has_many :groupings
  has_many :groups
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
end
