class AnswercommentsController < ApplicationController
  before_action :set_answercomment, only: [:show, :edit, :update, :destroy]
  before_action :set_answer
  before_action :set_question
  before_action :authenticate_user!

  # GET /answercomments
  # GET /answercomments.json
  def index
    @answercomments = Answercomment.all
  end

  # GET /answercomments/1
  # GET /answercomments/1.json
  def show
  end

  # GET /answercomments/new
  def new
    @answercomment = Answercomment.new
  end

  # GET /answercomments/1/edit
  def edit
    @question=@answer.question
  end

  # POST /answercomments
  # POST /answercomments.json
  def create
    @answercomment = current_user.answercomments.new(answercomment_params)
    @answercomment.answer = @answer
    
    respond_to do |format|
      if @answercomment.save
        format.html { redirect_to @answercomment.answer.question , notice: 'Answercomment was successfully created.' }
        format.json { render :show, status: :created, location: @answercomment }
      else
        format.html { render :new }
        format.json { render json: @answercomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answercomments/1
  # PATCH/PUT /answercomments/1.json
  def update
    respond_to do |format|
      if @answercomment.update(answercomment_params)
        format.html { redirect_to @answercomment.answer.question , notice: 'Answercomment was successfully updated.'  }
        format.json { render :show, status: :ok, location: @answercomment }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answercomments/1
  # DELETE /answercomments/1.json
  def destroy
    @answer=@answercomment.answer
    @answercomment.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'Answercomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   def sumar_puntaje
    @questioncomment=Questioncomment.find(params[:questioncomment_id])
    if @questioncomment.puntaje.nil?
      @questioncomment.puntaje=0
    end
    @questioncomment.update(puntaje: @questioncomment.puntaje + 1)
    #HasVotoQuestioncomment.create(answer_id: @answer.id , user: current_user)
    redirect_to @questioncomment.question
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answercomment
      @answercomment = Answercomment.find(params[:id])
    end

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_question
      @question=Question.find(params[:question_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def answercomment_params
      params.require(:answercomment).permit(:user_id, :answer_id, :texto)
    end
end
