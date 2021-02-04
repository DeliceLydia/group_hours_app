class ProjectRecorder < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
    validates :hours, presence: true
    belongs_to :author, class_name: 'User'
    has_many :groups_hours
    has_many :groups, through: :groups_hours
end
