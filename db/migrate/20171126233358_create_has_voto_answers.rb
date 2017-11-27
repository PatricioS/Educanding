class CreateHasVotoAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :has_voto_answers do |t|
      t.references :answer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
