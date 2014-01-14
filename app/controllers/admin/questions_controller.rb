class Admin::QuestionsController < ApplicationController
  before_action :signed_in_admin

  def index
  	@questions = Question.all.paginate page: params[:page]
  end

  def new
    @subjects = Subject.all
    if params[:question_type].present?
      @question = Question.new question_text: params[:question_text], subject_id: params[:subject_id], question_type: params[:question_type]
      if params[:question_type] == "true"
        @question.answer_text = AnswerText.new 
      else
        4.times {@question.answer_choices.build(status: false)}
      end
      render partial: "admin/questions/question_form" 
    else
      @question = Question.new
    end
  end

  def create
  	question = Question.new question_choices_params
    if question.save
      flash[:success] = I18n.t ".messages.add_project.success"
      redirect_to admin_questions_path
    else
      flash[:success] = I18n.t ".messages.add_project.unsuccess"
      render "new"
    end
  end

  def update
  	
  end

  def edit
  	
  end

  def destroy
  	
  end

  private
    def question_choices_params
      params.require(:question).permit :question_text, :subject_id,
      question_answer_choices_attributes: [:text, :status]
    end

    def question_text_params
      params.require(:question).permit :question_text, :subject_id,
      question_answer_text_attributes: [:text]
    end
end