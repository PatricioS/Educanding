class AddParamsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :nombre, :string
  	add_column :users, :apellido, :string
  	add_column :users, :facultad, :string
  	add_column :users, :puntaje, :integer
  end
end
