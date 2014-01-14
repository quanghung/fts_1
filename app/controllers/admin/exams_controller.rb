class Admin::ExamsController < ApplicationController
  def index
    @exams = Exam.all.paginate page: params[:page]
  end
end