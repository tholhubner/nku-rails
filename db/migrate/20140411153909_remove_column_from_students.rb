class RemoveColumnFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :seat
  end
end
