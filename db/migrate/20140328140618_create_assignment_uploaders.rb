class CreateAssignmentUploaders < ActiveRecord::Migration
  def change
    create_table :assignment_uploaders do |t|

      t.timestamps
    end
  end
end
