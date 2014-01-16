class Subject < ActiveRecord::Base
  has_many  :questions
  has_many  :exams
  has_many  :exam_users
  validates :name, presence: true
  validates :time, presence: true
end
