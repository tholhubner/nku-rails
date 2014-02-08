class StudentsController < ApplicationController
  
  ## displays all of currently enrolled students in the Bueller System
  def index
    @students = Student.all
  end
  
  def new
    if(current_student != nil)
      redirect_to students_path
    end
    @student = Student.new
  end
  
  ## creates a new student upon submitting the sign up form
  # redirects user to index
  def create
    @student = Student.new(student_params)
    if(@student.save)
      redirect_to students_path, :notice => 'You have been registered'
    else
      flash[:error] = 'Nope! Try again'
    end
  end
  
  ## allow the user to edit thier profile
  def edit
    @student = Student.find(params[:id])
    if current_student == @student
      render :edit
    else
      redirect_to "/students", notice: "You cannot access this page"
    end
  end
  
  ## allows the user to delete their profile 
  def destroy
    @student = Student.find(params[:id])
    if current_student == @user
      @student.destroy
    
      redirect_to students_path
    else
      redirect_to "/students", notice: "You cannot access this page"
    end
  end
  
  ## shows the specified student based on given ID
  def show
    @student = Student.find(params[:id])
  end
  
  private
  ## grabs all of the required student information needed for signup
  def student_params
    params.require(:student).permit(:name,:nickname,:email,:imageUrl,:password)
  end
end
