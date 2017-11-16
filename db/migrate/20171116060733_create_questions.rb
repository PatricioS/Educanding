class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :titulo
      t.text :texto

      t.timestamps
    end
  end
end
