class AddTypeofToUsers < ActiveRecord::Migration
  def change
    add_column :users, :typeof, :string
  end
end
