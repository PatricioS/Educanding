class AddPuntajeToQuestion < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :puntaje, :integer
  end
end
