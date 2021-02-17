class Grouping < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_hours
  has_many :groups, through: :group_hours
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  validates :hours, presence: true, numericality: { less_than: 10_000 }
  
end
