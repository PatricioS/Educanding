class AddFacultadIdToQuestions < ActiveRecord::Migration[5.1]
  def change
  	 add_reference :questions, :facultad, foreign_key: true
  end
end
