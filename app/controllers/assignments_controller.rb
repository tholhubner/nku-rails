class AssignmentsController < ApplicationController
  
  ## checks if the student is an admin, if so allows viewing of new page
  def new
    if current_student.admin_user?
      @assignment = Assignment.new
      @assignment.student_id = current_student.id
    else
      redirect_to root_path, notice: "You didn't say the magic word"
    end
  end
  
  ## show the assignments and their grades
  # when an assignment is clicked, filter shown assignments by student_id
  def index
    q = params[:search]
    if current_student.admin_user?
      current_student.name = "All Students"
      if q.blank?
        @assignments = Assignment.all
      else
        @assignments = Assignment.find(:all, :conditions => ["student_id LIKE ?", q])
      end
    else
      @assignments = current_student.assignments
    end
  end
  
  #creation of a new assignment
  def create
    @assignment = Assignment.create!(assignment_params)
    redirect_to root_path, notice: "Assignment has been added"
  end
  
  private 
  def assignment_params
    params.require(:assignment).permit!
  end
end
