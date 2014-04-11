class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :attended_on
      t.integer :seat_num
      t.integer :user_id
      t.timestamps
    end
  end
end
