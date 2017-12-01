class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :answercomments, dependent: :destroy
  has_many :has_voto_answers, dependent: :destroy
end
