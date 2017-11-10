class CreatePregunta < ActiveRecord::Migration[5.1]
  def change
    create_table :pregunta do |t|

      t.timestamps
    end
  end
end
