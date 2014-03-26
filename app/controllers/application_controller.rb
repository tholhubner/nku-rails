class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  ## get the information on the currently logged in student
  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id].present?
  end
  helper_method :current_student
  
  def logged_in?
    current_student != nil
  end
  
  def authorize
    unless current_student.admin_user?
      flash[:error] = "Unauthorized user."
      redirect_to root_path
      false
    end
  end
  
  before_action :require_login
  
  skip_before_action :require_login, only: [:new, :create]
  
  private
  def require_login
    unless logged_in?
      redirect_to signin_path
    end
  end
end
