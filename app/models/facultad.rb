class Facultad < ApplicationRecord
	has_many :users
	has_many :questions , dependent: :destroy

	@@orden=false

	scope :preguntas, -> { reorder(cant_questions: :desc)}


	def self.orden=(value)
 		@@orden=value
 	end

 	def self.orden
 		return @@orden
 	end
end
