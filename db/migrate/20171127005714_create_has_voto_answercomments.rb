class CreateHasVotoAnswercomments < ActiveRecord::Migration[5.1]
  def change
    create_table :has_voto_answercomments do |t|
      t.references :answercomment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
