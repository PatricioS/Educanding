class Tag < ApplicationRecord
	validates :nombre , presence: true
	has_many :has_tag_questions, dependent: :destroy
	has_many :questions, through: :has_tag_questions
end
