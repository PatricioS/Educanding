class Answer < ApplicationRecord
	has_many :comments, dependent destroy
	belongs_to :question
end
