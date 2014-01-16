class Admin::ExamsController < ApplicationController
  def index
    @exams = Exam.all.paginate page: params[:page]
  end

  def show
    @exam = Exam.find params[:id]
  end

  def edit
    @exam = Exam.find params[:id]
    @subjects = Subject.all
    @subject = Subject.find @exam.subject_id
  end

  def update
    exam = Exam.find params[:id]
    if exam.update_attributes! exam_params
      flash[:success] = I18n.t ".messages.update.success"
      redirect_to admin_exams_path
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

  def new
    @subjects = Subject.all
    @exam = Exam.new
    User.all.each do |user|
      @exam.exam_users.build user_id: user.id
                end
  end

  def create
    @exam = Exam.new exam_params
    if @exam.save
      flash[:success] = I18n.t ".messages.add_exam.success"
      redirect_to admin_exams_path
    else
      flash[:success] = I18n.t ".messages.add_exam.unsuccess"
      render "new"
    end
  end



  def destroy
    exam = Exam.find params[:id]
    if exam.exam_users.count == 0 and exam.destroy!
      flash[:success] = I18n.t ".messages.delete_user.success"
    else
      flash[:success] = I18n.t ".messages.delete_user.unsuccess"
    end
    redirect_to admin_exams_path
  end

        private
         def exam_params
         params.require(:exam).permit :name,:subject_id,
         exam_users_attributes: [:exam_id, :user_id,:status_exam_user]
         end

end