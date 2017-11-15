class CreateUniversidads < ActiveRecord::Migration[5.1]
  def change
    create_table :universidads do |t|
      t.string :nombre
      t.string :pais

      t.timestamps
    end
  end
end
