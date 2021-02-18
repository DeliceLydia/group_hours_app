class Grouping < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_hours
  has_many :groups, through: :group_hours
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  validates :hours, presence: true, numericality: { less_than: 10_000 }

  def self.grouping_index(params_data, current)
    includes(groups: [icon_attachment: :blob]).paginate(page: params_data, per_page: 3)
      .where('author_id=?', current.id).joins(:groups)
  end

  def self.external(params_data, current)
    includes(groups: [icon_attachment: :blob]).paginate(page: params_data, per_page: 3)
      .where('author_id=?', current.id).left_outer_joins(:groups).where('groups.id IS NULL')
  end
end
