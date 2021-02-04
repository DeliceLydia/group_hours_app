class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
    has_many :projects_recorders
    has_many :groups
    has_one_attached :avatar
    validates :avatar, blob: { content_type: :image }

    def display_image
        avatar.variant(resize_to_limit: [500, 500])
    end
end
