class Admin::QuestionsController < ApplicationController
  before_action :signed_in_admin

  def index
  	@questions = Question.all.paginate page: params[:page]
  end

  def new
  	
  end

  def create
  	
  end

  def update
  	
  end

  def edit
  	
  end

  def destroy
  	
  end
end