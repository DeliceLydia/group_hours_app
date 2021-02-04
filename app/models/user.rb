class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
    has_many :projects_recorders
    has_many :groups
end
