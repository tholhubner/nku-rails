class SessionsController < ApplicationController
  def new
  end
  
  ## creates a session for the student that is signing in
  def create
    @student = Student.find_by_email(params[:email])
    if (@student && @student.authenticate(params[:password]))
      session[:student_id] = @student.id
      redirect_to show_student_path, :notice => 'Welcome, @student.name' 
    else
      flash.now.alert = 'Invalid email address or password combination. Try again.'
      render 'new'
    end
  end
  
  ## destroys the students session upon logging out
  def destroy
    session[:student_id] = nil
    redirect_to 'students', :notice => 'You have been signed out'
  end
end
