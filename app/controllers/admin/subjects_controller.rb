class Admin::SubjectsController < ApplicationController
  # before_action :signed_in_admin
  
  def index
    @subjects = Subject.all.paginate page: params[:page]
  end

  def new
    @subject = Subject.new
  end

  def create
    subject = Subject.new subject_params
    if subject.save
      flash[:success] = I18n.t ".messages.add_subject.success"
      redirect_to admin_subjects_path
    else
      flash[:success] = I18n.t ".messages.add_subject.unsuccess"
      render "new"
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    subject = Subject.find params[:id]
    if subject.update_attributes subject_params
      flash[:success] = I18n.t ".messages.update.success"
      redirect_to admin_subjects_path
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

  def destroy
    subject = Subject.find params[:id]
    if subject.destroy!
      flash[:success] = I18n.t ".messages.delete_user.success"
    else
      flash[:success] = I18n.t ".messages.delete_user.unsuccess"
    end
    redirect_to admin_subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit :name, :time
  end
end