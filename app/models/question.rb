class Question < ApplicationRecord
	belongs_to :user
	belongs_to :facultad
	has_many :answers , dependent: :destroy
	has_many :questioncomments , dependent: :destroy
	has_many :has_tag_questions, dependent: :destroy
	has_many :tags, through: :has_tag_questions
	after_create :save_tags
	#after_update :save_tags
	#before_update :del_tags
	default_scope { order(created_at: :desc)}
	scope :respuestas, -> { reorder(cant_answers: :asc)}
	@@orden=false

	  #Custom setter
	
  	def tags=(value)
  	  @tags = value
 	 end
 	def actualizar_visitas
 	 if self.visitas ==nil
 	 	self.visitas=0;
 	 end
 	 self.update(visitas: self.visitas + 1 )
 	end

 	def self.orden=(value)
 		@@orden=value
 	end

 	def self.orden
 		return @@orden
 	end

 	def del_tags
 	  	if self.tags.any?
 	  		HasTagQuestion.where(question_id: self.id).destroy_all
 	  	end
    end

  def save_tags
    @tags.each do |tag| 
        HasTagQuestion.create(tag_id: tag, question_id: self.id)
    end
  end


  def  ok
  	@ok=true
  end
  def ok=(value)
  	@ok=value
  end
end
