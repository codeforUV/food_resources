module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def authenticate_user!
    redirect_to login_path, alert: "You need to login to access that page." unless user_signed_in?
  end

  def login(user)
    reset_session
    user.regenerate_session_token
    session[:current_user_session_token] = user.reload.session_token
  end

  def logout
    user = current_user
    reset_session
    user.regenerate_session_token
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: "You are already logged in." if user_signed_in?
  end

  private

  def current_user
    Current.user ||= session[:current_user_session_token] && User.find_by(session_token: session[:current_user_session_token])
  end

  def user_signed_in?
    Current.user.present?
  end
end
