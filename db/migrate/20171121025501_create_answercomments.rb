class CreateAnswercomments < ActiveRecord::Migration[5.1]
  def change
    create_table :answercomments do |t|
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true
      t.text :texto

      t.timestamps
    end
  end
end
