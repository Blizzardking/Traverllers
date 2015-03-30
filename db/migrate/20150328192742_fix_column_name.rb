class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :username, :firstname
    rename_column :users, :email_address, :email
    add_column :users, :lastname, :string
    add_column :users, :date_of_birth, :datetime
    remove_column :users, :password
    remove_column :users, :age
    
  end
end
