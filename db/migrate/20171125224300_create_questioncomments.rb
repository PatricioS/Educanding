class CreateQuestioncomments < ActiveRecord::Migration[5.1]
  def change
    create_table :questioncomments do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.text :texto

      t.timestamps
    end
  end
end
