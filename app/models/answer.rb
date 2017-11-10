class Answer < ApplicationRecord
	has_many :commentarys, dependent destroy
	belongs_to :question
end
