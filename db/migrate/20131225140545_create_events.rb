class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date_on
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
