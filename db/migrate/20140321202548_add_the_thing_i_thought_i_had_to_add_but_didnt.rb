class AddTheThingIThoughtIHadToAddButDidnt < ActiveRecord::Migration
  def change
    add_column :assignments, :student_id, :integer
  end
end
