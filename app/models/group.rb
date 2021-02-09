class Group < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
    belongs_to :user
    has_many :groups_hours
    has_many :groupings, through: :groups_hours
    has_one_attached :icon
    validates :icon, blob: { content_type: :image }

    def display_image
        icon.variant(resize_to_limit: [500, 500])
    end
end
