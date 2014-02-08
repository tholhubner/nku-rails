class AddUserDataToStudent < ActiveRecord::Migration
  def change
    add_column :students, :password_hashed, :string
  end
end
