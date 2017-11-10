class Question < ApplicationRecord
	has_many :answers, dependent destroy
	has_many :commentarys, dependent destroy
end
