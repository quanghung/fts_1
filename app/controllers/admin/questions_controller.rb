class Admin::QuestionsController < ApplicationController
  before_action :signed_in_admin

  def index
  	@questions = Question.all.paginate page: params[:page], per_page:4
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
    if params[:question_type].present?
      question = Question.new question_text_params
    else
      question = Question.new question_choices_params
    end
    
    if question.save
      flash[:success] = I18n.t ".messages.add_project.success"
      redirect_to admin_questions_path
    else
      flash[:success] = I18n.t ".messages.add_project.unsuccess"
      render "new"
    end
    binding.pry
  end

  def update
  	@question = Question.find params[:id]
    if @question.question_type == true
      question_params = question_text_params
    else
      question_params = question_choices_params
    end

    if @question.update_attributes! question_params
      flash[:success] = I18n.t ".messages.add_subject.success"
      redirect_to admin_questions_path
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

  def edit
    @subjects = Subject.all
  	@question = Question.find params[:id]
    @subject = @question.subject
  end

  def destroy
  	question = Question.find params[:id]
    if question.destroy!
      flash[:success] = I18n.t ".messages.delete_user.success"
    else
      flash[:success] = I18n.t ".messages.delete_user.unsuccess"
    end
    redirect_to admin_questions_path
  end

  private
    def question_choices_params
      params.require(:question).permit :question_text, :subject_id, :question_type,
      answer_choices_attributes: [:id,:text, :status, :question_id]
    end

    def question_text_params
      params.require(:question).permit :question_text, :subject_id, :question_type,
      answer_text_attributes: [:id, :text, :question_id]
    end
end