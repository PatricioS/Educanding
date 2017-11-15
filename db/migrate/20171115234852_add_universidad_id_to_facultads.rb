class AddUniversidadIdToFacultads < ActiveRecord::Migration[5.1]
  def change
    add_column :facultads, :universidad_id, :integer
  end
end
