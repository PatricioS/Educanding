class Answer < ApplicationRecord
	belongs_to :question
	has_many :comments_answers, dependent: :destroy
end
