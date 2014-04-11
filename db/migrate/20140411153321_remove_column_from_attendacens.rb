class RemoveColumnFromAttendacens < ActiveRecord::Migration
  def change
    remove_column :attendances, :user_id
    add_column :attendances, :student_id, :integer
  end
end
