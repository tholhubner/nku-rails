class AssignmentUploader < ActiveRecord::Base
  def initialize(file)
    @file = file
    import
  end
  
  def import
    CSV.foreach(@file.path, headers: true, header_converters: :symbol) do |row|
      email = row.delete(:email)
      row[:student_id] = Student.find_by_email!(email).id
      assignment = Assignment.find_or_initialize_by_student_id_and_assignment_name(row[:student_id], row[:assignment_name])
      assignment.update_attributes(row.to_hash)
    end
  end
end
