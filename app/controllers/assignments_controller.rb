class AssignmentsController < ApplicationController
  
  def new
    @assignment = Assignment.new
  end
  
  def index
    @assignment = Assignment.all
  end
  
  def create
    @assignment = Assignment.create!(assignment_params)
    redirect_to root_path, notice: "Assignment has been added"
  end
  
  def view
    
  end
  
  private 
  def assignment_params
    params.require(:assignment).permit!
  end
end
