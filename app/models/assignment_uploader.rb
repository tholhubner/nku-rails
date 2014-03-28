class AssignmentUploader < ActiveRecord::Base
  def initialize(file)
    @file = file
    upload_assignment
  end
  
  def upload_assignment
    CSV.foreach(@file.path, headers: true, header_converters: :symbol) do |row|
      email = row.delete(:email)
      row[:student_id] = Student.find_by_email(email).id
      Assignment.create!(row.to_hash)
    end
  end
end
