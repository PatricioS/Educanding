class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_puntaje, only:  [:save]


  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
        @questioncomment= Questioncomment.new
        @answercomment= Answercomment.new
  end

  # GET /questions/new
  def new
    @question = Question.new
    @tags = Tag.all
  end

  # GET /questions/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)
    @question.puntaje= 0
    @question.tags = params[:tags]

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question.tags=nil
    @question.tags = params[:tags]
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


 def sumar_puntaje
    @question=Question.find(params[:question_id])
    if @question.puntaje.nil?
      @question.puntaje=0
    end
    @question.update(puntaje: @question.puntaje + 1)
    HasVotoQuestion.create(question_id: @question.id , user: current_user)
    redirect_to @question
  end


def restar_puntaje
    @question=Question.find(params[:question_id])
    if @question.puntaje.nil?
      @question.puntaje=0
    end
    @question.update(puntaje: @question.puntaje - 1)
    HasVotoQuestion.create(question_id: @question.id , user: current_user)
    redirect_to @question
  end



  private
    # Use callbacks to share common setup or constraints between actions.
 


    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:titulo, :texto, :tags)
    end
    def set_puntaje
      @question.puntaje ||=0
    end
end
