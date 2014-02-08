class CreateBuellers < ActiveRecord::Migration
  def change
    create_table :buellers do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :imageUrl

      t.timestamps
    end
  end
end
