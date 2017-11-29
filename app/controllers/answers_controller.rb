class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_question
  before_action :authenticate_user!

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
    
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
            @answercomment=Answercomment.new
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = current_user.answers.new(answer_params)
    @answer.question = @question
    @answer.puntaje = 0

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer.question, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def sumar_puntaje
    @answer=Answer.find(params[:answer_id])
    if @answer.puntaje.nil?
      @answer.puntaje=0
    end
    @answer.update(puntaje: @answer.puntaje + 1)
    HasVotoAnswer.create(answer_id: @answer.id , user: current_user)
    redirect_to @answer.question
  end

  def restar_puntaje
    @answer=Answer.find(params[:answer_id])
    if @answer.puntaje.nil?
      @answer.puntaje=0
    end
    @answer.update(puntaje: @answer.puntaje - 1)
    HasVotoAnswer.create(answer_id: @answer.id , user: current_user)
    redirect_to @answer.question
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question=Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:user_id, :question_id, :texto)
    end
end
