class AttendancesController < ApplicationController
  ## create a new attendance record for the current student
  def new
    @attendance = Attendance.new
  end
  
  ## creates the attendance record based on the information that the student
  ## entered and what the session is currently holding
  def create
    @attendance = current_student.attendances.build(attendance_params)
    @attendance.attended_on = Date.today
    
    if @attendance.save
      redirect_to attendances_path, notice: "Your presence has been noted."
    else
      render 'new'
    end
  end
  
  ## display the attendances on the index page
  def index
    query = params[:search]
    if query.blank?
      @attendances = Attendance.all
    else
      @attendances = Attendance.find(:all, :conditions => ["student_id LIKE ?", query])
    end
  end
  
  def edit
    @attendance = Attendance.find(params[:id])
  end
    
  private 
  def attendance_params
    params.require(:attendance).permit(:seat)
  end
  
end
