class CreatePms < ActiveRecord::Migration
  def change
    create_table :pms do |t|
      t.string :subject
      t.text :body
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
