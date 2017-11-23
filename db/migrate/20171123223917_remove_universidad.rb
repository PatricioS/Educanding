class RemoveUniversidad < ActiveRecord::Migration[5.1]
  def change
  	drop_table :universidads
  end
end
