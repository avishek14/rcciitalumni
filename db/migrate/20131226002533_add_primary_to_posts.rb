class AddPrimaryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :primary, :boolean
  end
end
