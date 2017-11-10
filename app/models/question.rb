class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	has_many :commentaries, dependent: :destroy
end
