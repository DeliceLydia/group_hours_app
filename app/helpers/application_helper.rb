module ApplicationHelper
    def burger_icon
        return current_user if logged_in?
        user_path
    end

    def creation_date(obj)
        obj.created_at.strftime('%d %b %Y')
    end
end
