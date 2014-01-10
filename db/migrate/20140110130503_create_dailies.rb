class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.string :title
      t.datetime :date

      t.timestamps
    end
  end
end
