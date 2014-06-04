module UserHelper
  def user_picture_url(user)
    user.picture_url || "placeholder.jpg"
  end
end
