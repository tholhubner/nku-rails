class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end
  
  ## displays all of currently enrolled students in the Bueller System
  def index
    @students = Student.all
  end
  
  ## creates a new student upon submitting the sign up form
  # redirects user to index
  def create
    @student = Student.create!(student_params)
    session[:student_id] = @student_id
    redirect_to students_path, notice: 'Hi, #{@student.name}. Welcome to the Bueller System.'
  end
  
  ## allow the user to edit thier profile
  def edit
    @student = current_student
  end
  
  ##updates the users information after they have done so using the edit page
  def update
    current_student.update_attributes!(student_params)
    redirect_to student_path, notice: 'Update was successful!'
  end
  
  private
  ## grabs all of the required student information needed for signup
  def student_params
    params.require(:student).permit!
  end
end
