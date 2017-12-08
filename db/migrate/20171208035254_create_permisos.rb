class CreatePermisos < ActiveRecord::Migration[5.1]
  def change
    create_table :permisos do |t|
      t.integer :crearpost
      t.integer :votarpostivo
      t.integer :comentar
      t.integer :votarnegativo
      t.integer :etiqueta
      t.integer :facultad
      t.integer :admin

      t.timestamps
    end
  end
end
