class AddPuntajeToAnswer < ActiveRecord::Migration[5.1]	
  def change
  	add_column :answers, :puntaje, :integer
  	add_column :answercomments, :puntaje, :integer
  	add_column :questioncomments, :puntaje, :integer

  end
end
