class ApplicationController < ActionController::Base
  helper_method :current_user, :user_owns_record?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticated
    unless current_user.present?
      flash[:error] = "You must sign in first to perform this action."
      redirect_to sign_in_path
    end
  end

  def user_owns_record?(record)
    current_user == record.user
  end
end
