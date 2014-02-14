class AddColumnsToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :seat, :integer
    add_column :attendances, :attended_on, :datetime
  end
end
