class AddBorrarToTags < ActiveRecord::Migration[5.1]
  def change
  	add_column :tags, :borrado, :boolean
  end
end
