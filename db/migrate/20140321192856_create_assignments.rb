class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :student_name
      t.string :name
      t.decimal :score
      t.decimal :total

      t.timestamps
    end
  end
end
