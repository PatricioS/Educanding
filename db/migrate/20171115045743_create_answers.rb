class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :texto
      t.integer :puntaje

      t.timestamps
    end
  end
end
