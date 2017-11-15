class AddForeignKeyToFacultads < ActiveRecord::Migration[5.1]
  def change
  	add_indes :posts, :usuario_id
  end
end
