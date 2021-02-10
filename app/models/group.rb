class Group < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
    belongs_to :user
    has_many :groups_hours
    has_many :groupings, through: :groups_hours
    has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/

    def display_image
        icon.variant(resize_to_limit: [500, 500])
    end
end
