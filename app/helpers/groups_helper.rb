module GroupsHelper
  def group_icon(group)
    if group.icon.present?
      image_tag group.icon, class: 'group-img'
    else
      image_tag 'default-group-icon.png', class: 'group-img'
    end
  end
end
