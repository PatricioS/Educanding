class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	has_many :comments_question, dependent: :destroy
end
