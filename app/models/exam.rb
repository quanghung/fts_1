class Exam < ActiveRecord::Base
  belongs_to :subject
  has_many :exam_questions
  has_many :questions, through: :exam_questions
end
