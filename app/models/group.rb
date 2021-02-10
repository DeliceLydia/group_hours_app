class Group < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
    belongs_to :user
    has_many :groups_hours
    has_many :groupings, through: :groups_hours
    has_one_attached :icon
    validates :icon, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }

    def display_image
        icon.variant(resize_to_limit: [500, 500])
    end
end
