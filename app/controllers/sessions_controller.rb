class SessionsController < ApplicationController
  def new
  end
  
  ## creates a session for the student that is signing in
  def create
    student = Student.find_by(email: session_params[:email])
    if student && student.authenticate(session_params[:password])
      session[:student_id] = student.id
      redirect_to students_path, notice: "Signed in!"
    else
      flash[:error] = "Invalid email or password"
      render :new
    end
  end
  
  ## destroys the students session upon logging out
  def destroy
    session[:student_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end
  
  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end