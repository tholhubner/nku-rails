class AddAttendance < ActiveRecord::Migration
  def change
    add_column :students, :seat, :number
    add_column :students, :attended_on, :datetime
  end
end
