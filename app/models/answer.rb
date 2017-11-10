class Answer < ApplicationRecord
	has_many :commentaries, dependent: :destroy
	belongs_to :question
end
