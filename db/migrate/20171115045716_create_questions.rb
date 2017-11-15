class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :titulo
      t.string :texto
      t.integer :puntaje

      t.timestamps
    end
  end
end
