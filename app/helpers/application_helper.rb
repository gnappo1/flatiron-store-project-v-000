module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_cart
    current_user.current_cart if current_user
  end


end
