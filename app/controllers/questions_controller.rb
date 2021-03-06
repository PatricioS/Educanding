class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show,:cambiar_orden]
  before_action :set_puntaje, only:  [:save]
  #before_action :set_facultad, only: [:create, :update]


  # GET /questions
  # GET /questions.json
  def index
    #@questions = Question.all
    @questions = Question.all
    if params[:titulo].present?
      @questions=@questions.where("titulo ILIKE ?", "%#{params[:titulo]}%")
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
        @questioncomment= Questioncomment.new
        @answercomment= Answercomment.new
        @question.actualizar_visitas
  end

  # GET /questions/new
  def new
    @question = Question.new
    @tags = Tag.all
  end

  # GET /questions/1/edit
  def edit
    @tags = Tag.all
    @question.ok=true
  end


  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)
    @question.puntaje= 0
    @question.visitas=0
    @question.cant_answers = 0
    @question.tags = params[:tags]
    if current_user.facultad.nombre== ""
      @question.facultad= Facultad.find(params[:question][:facultad_id])
    else
      @question.facultad=current_user.facultad
    end
    if @question.facultad_id==nil
      raise params.yaml
    end
    @question.facultad.update(cant_questions: @question.facultad.cant_questions+1)
    respond_to do |format|
      if params[:tags]!=nil
        if params[:tags].length <6
          if @question.facultad.nombre== ""
              @question.errors.add(:tags, "Necesitas elegir una facultad")
              format.html { render :new }
              format.json { render json: @question.errors, status: :unprocessable_entity }
          else
          if @question.save
            format.html { redirect_to @question, notice: 'La pregunta se creo correctamente' }
            format.json { render :show, status: :created, location: @question }
          else
            format.html { render :new }
            format.json { render json: @question.errors, status: :unprocessable_entity }
          end
          end
        else
          @question.errors.add(:tags, "No se admiten mas de 5 etiquetas por pregunta")
         format.html { render :new }
         format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      else
        @question.errors.add(:tags, "Necesitas elegir al menos 1 etiqueta")
         format.html { render :new }
         format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if(@question.ok == true)
      @question.del_tags
      @question.tags = params[:tags]
      respond_to do |format|
      if params[:tags]!=nil
        if params[:tags].length <6
          if @question.update(question_params)
            @question.save_tags
            format.html { redirect_to @question, notice: 'La pregunta se actualizo correctamente' }
            format.json { render :show, status: :ok, location: @question }
          else
            format.html { render :edit }
            format.json { render json: @question.errors, status: :unprocessable_entity }
          end
        else
          @question.errors.add(:tags, "No se admiten mas de 5 etiquetas por pregunta")
         format.html { render :edit }
         format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      else
        @question.errors.add(:tags, "Necesitas elegir al menos 1 etiqueta")
         format.html { render :edit }
         format.json { render json: @question.errors, status: :unprocessable_entity }
      end
      end
  else
    respond_to do |format|
        if @question.update(question_params)
            format.html { redirect_to @question, notice: 'La pregunta se actualizo correctamente' }
            format.json { render :show, status: :ok, location: @question }
          else
            format.html { render :edit }
            format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if @question.answers.any?
      @question.answers.each do |answer|
        if(answer.answercomments.any?)
          answer.answercomments.each do |acomment|
            HasVotoAnswercomment.where(answercomment_id: acomment.id).destroy_all
          end
        end
        HasVotoAnswer.where(answer_id: answer.id).destroy_all
      end
    end
    if @question.questioncomments.any?
        @question.questioncomments.each do |qcomment|
          HasVotoQuestioncomment.where(questioncomment_id: qcomment.id).destroy_all
        end
    end
    HasVotoQuestion.where(question_id: @question.id).destroy_all
    
    @question.tags.where(borrado: true).each do |tag|
      if tag.questions.length == 1
        tag.destroy
      end
    end
    @question.facultad.update(cant_questions: @question.facultad.cant_questions-1)
    @question.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'La pregunta se borro correctamente' }
      format.json { head :no_content }
    end
  end


def cambiar_orden
  Question.orden = true
  redirect_to root_path
end


 def sumar_puntaje
    
    @question=Question.find(params[:question_id])
    if @question.puntaje.nil?
      @question.puntaje=0
    end
    @question.update(puntaje: @question.puntaje + 1)
    @question.ok=false
    @question.user.update(puntaje:  @question.user.puntaje + 5)
    HasVotoQuestion.create(question_id: @question.id , user: current_user)
    redirect_to @question
  end


def restar_puntaje
    @question=Question.find(params[:question_id])
    if @question.puntaje.nil?
      @question.puntaje=0
    end
    @question.update(puntaje: @question.puntaje - 1)
    if @question.user.puntaje - 2 < 1
       @question.user.update(puntaje:  1)
    else
      @question.user.update(puntaje:  @question.user.puntaje - 2)
    end
    if current_user.puntaje > 1
      current_user.update(puntaje: current_user.puntaje - 1 )
    end

    @question.ok=false
    HasVotoQuestion.create(question_id: @question.id , user: current_user)
    redirect_to @question
  end


3000
  private

    # Use callbacks to share common setup or constraints between actions.

    def set_facultad
      @facultad= Facultad.find(params[:facultad_id])
    end
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:titulo, :texto, :facultad_id, {:tags => []})
    end
    def set_puntaje
      @question.puntaje ||=0
    end
end
