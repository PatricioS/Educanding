class HasVotoQuestioncomment < ApplicationRecord
  belongs_to :questioncomment
  belongs_to :user
end
