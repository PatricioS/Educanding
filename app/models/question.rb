class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	has_many :questioncomments
	has_many :users
end
