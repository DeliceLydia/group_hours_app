module UsersHelper
  def display_avatar(user)
    if user.avatar.present?
      image_tag user.avatar.url, class: 'avatar rounded-circle'
    else
      image_tag 'default-avatar.png', class: 'avatar rounded-circle'
    end
  end
end
