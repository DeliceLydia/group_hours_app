class GroupHour < ApplicationRecord
    belongs_to :group
    belongs_to :project_recorder
end
