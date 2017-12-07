class DelFacultadToUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :facultad, :string
  end
end
