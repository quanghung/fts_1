class ExamUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam
  belongs_to :subject
  has_many :user_test
end