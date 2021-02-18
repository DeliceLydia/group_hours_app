class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 100 }
  belongs_to :user
  has_many :group_hours
  has_many :groupings, through: :group_hours
  has_one_attached :icon
  validates :icon, blob: { content_type: :image }

  def self.index_group(data_params)
    includes(:user).paginate(page: data_params, per_page: 3).order(:name).with_attached_icon
  end

  def self.show_group(params_id)
    includes(:groupings, :user).find(params_id)
  end
end
