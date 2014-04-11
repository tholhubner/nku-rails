class RemoveColumnFromAttendancesAddNewColumn < ActiveRecord::Migration
  def change
    remove_column :attendances, :seat_num
    add_column :attendances, :seat, :integer
  end
end
