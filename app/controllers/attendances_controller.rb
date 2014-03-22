class AttendancesController < ApplicationController
  
  ## display who is currently sitting in the each of the seats in the class room
  def index
    now = Date.today
    @in_seat_1 = Student.in_seat(1, now) 
    @in_seat_2 = Student.in_seat(2, now)
    @in_seat_3 = Student.in_seat(3, now)
    @in_seat_4 = Student.in_seat(4, now)
  end
  
  ## create a new attendance record for the current student
  def new
    @student = current_student
    if !@student
      redirect_to new_session_path
    end
    @attendance = Attendance.new
  end
  
  ## creates the attendance record based on the information that the student
  ## entered and what the session is currently holding
  def create
    @student = current_student
    if !@student
      redirect_to new_session_path
    end
    @attendance = Attendance.new(attendance_params)
    redirect_to attendances_path, notice: 'Your presence has been logged'
    
  end
    
  private 
  def attendance_params
    student = current_student
    params[:attendance][:student_id] = current_student.id
    params[:attendance][:attended_on] = Date.today
    params.require(:attendance).permit(:seat, :student_id, :attended_on)
  end
  
end
