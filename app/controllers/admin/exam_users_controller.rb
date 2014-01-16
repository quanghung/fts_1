class Admin::ExamUsersController < ApplicationController
  	def index
      @examusers=ExamUser.all      
    end
end