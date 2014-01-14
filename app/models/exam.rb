class Exam < ActiveRecord::Base
  belongs_to :subject
  has_many :exam_users
  has_many :exams, through: :exam_users
  accepts_nested_attributes_for :exam_users
end
