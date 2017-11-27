class Question < ApplicationRecord
	belongs_to :user
	has_many :answers , dependent: :destroy
	has_many :questioncomments , dependent: :destroy
	has_many :has_tag_questions, dependent: :destroy
	has_many :tags, through: :has_tag_questions
	after_create :save_tags

	  #Custom setter
  	def tags=(value)
  	  @tags = value
 	 end


  def save_tags
    @tags.each do |tag| 
        HasTagQuestion.create(tag_id: tag, question_id: self.id)
    end
  end


end
