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
    @question.update(cant_answers: @question.cant_answers + 1)
    @answer.puntaje = 0
    @answer.best = false;

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: 'Respuesta creada satisfactoriamente' }
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
        format.html { redirect_to @answer.question, notice: 'Respuesta actualizada satisfactoriamente' }
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

    @question=@answer.question
    @question.update(cant_answers: @question.cant_answers - 1)
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'La respuesta fue borrada con exito' }
      format.json { head :no_content }
    end
  end


  def mejor_respuesta
    @answer=Answer.find(params[:answer_id])
    @question=@answer.question
    if @question.answers.where(best: true).any?
      @question.answers.where(best: true).first.update(best: false)
    end

    @answer.update(best: true)
    redirect_to @question
  end

   def sumar_puntaje
    @answer=Answer.find(params[:answer_id])
    if @answer.puntaje.nil?
      @answer.puntaje=0
    end
    @answer.update(puntaje: @answer.puntaje + 1)
    HasVotoAnswer.create(answer_id: @answer.id , user: current_user)
    @answer.user.update(puntaje: @answer.user.puntaje + 10)
    redirect_to @answer.question
  end

  def restar_puntaje
    @answer=Answer.find(params[:answer_id])
    if @answer.puntaje.nil?
      @answer.puntaje=0
    end
    @answer.update(puntaje: @answer.puntaje - 1)
    HasVotoAnswer.create(answer_id: @answer.id , user: current_user)
    if @answer.user.puntaje - 2 < 1
       @answer.user.update(puntaje:  1)
    else
      @answer.user.update(puntaje:  @answer.user.puntaje - 2)
    end
    if current_user.puntaje > 1
      current_user.update(puntaje: current_user.puntaje - 1 )
    end
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
