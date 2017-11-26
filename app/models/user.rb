class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :questions
   has_many :answers
   has_many :answercomments
   has_many :questioncomments 
   before_create :set_puntaje_inicial

   private
   def set_puntaje_inicial
   	self.puntaje = 1
   end
end
