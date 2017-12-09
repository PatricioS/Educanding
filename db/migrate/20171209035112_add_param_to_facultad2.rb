class AddParamToFacultad2 < ActiveRecord::Migration[5.1]
  def change
  	add_column :facultads, :oculto, :boolean
  end
end
