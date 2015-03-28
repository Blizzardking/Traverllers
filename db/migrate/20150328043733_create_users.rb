class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email_address
      t.integer :age
      t.boolean :gender
      t.string :safe_question
      t.string :safe_answer

      t.timestamps
    end
  end
end
