class AddAdmin < ActiveRecord::Migration
  def change
    add_column :students, :admin_user, :boolean
  end
end
