module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'ログインしてください。'
      redirect_to login_url
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      flash[:danger] = 'ゲストユーザーは削除できません。'
      redirect_to root_path
    end
  end
end
