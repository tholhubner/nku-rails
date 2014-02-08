class CreateAddNewPasses < ActiveRecord::Migration
  def change
    create_table :add_new_passes do |t|

      t.timestamps
    end
  end
end
