class RemoveParamsFromUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :name, :string
  	remove_column :users, :last_name, :string
  	remove_column :users, :facultad, :string
  end
end
