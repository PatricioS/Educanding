class VisitasToQuestion < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :visitas, :integer
  end
end
