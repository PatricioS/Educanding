class HasVotoAnswercomment < ApplicationRecord
  belongs_to :answercomment
  belongs_to :user
end
