class Question < ActiveRecord::Base
  has_many :answer_choices
  has_one :answer_text
  has_many :exam_questions
  has_many :exams, through: :exam_questions
  belongs_to :subjects

  validates :question_text, length: {maximum: 512}, presence: true
  validates :subject_id, presence:true
end
