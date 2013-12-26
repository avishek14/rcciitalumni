class AddSeenToPms < ActiveRecord::Migration
  def change
    add_column :pms, :seen, :boolean
  end
end
