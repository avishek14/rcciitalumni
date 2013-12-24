class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.string :email
      t.integer :phone
      t.integer :yearofpassing
      t.string :department
      t.string :status
      t.string :inst
      t.string :posit
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
