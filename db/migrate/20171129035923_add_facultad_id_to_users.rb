class AddFacultadIdToUsers < ActiveRecord::Migration[5.1]
  def change
  	 add_reference :users, :facultad, foreign_key: true
  end
end
