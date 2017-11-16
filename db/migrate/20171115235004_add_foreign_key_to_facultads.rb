class AddForeignKeyToFacultads < ActiveRecord::Migration[5.1]
  def change
  	add_index :facultads, :universidad_id
  end
end
