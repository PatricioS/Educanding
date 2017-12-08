class AddParams < ActiveRecord::Migration[5.1]
  def change
  	add_column :answers, :best, :boolean
  	add_column :questions, :cant_answers, :integer
  	add_column :facultads, :cant_questions, :integer
  end
end
