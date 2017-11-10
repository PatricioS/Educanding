class AddTextoToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :texto, :string
  end
end
