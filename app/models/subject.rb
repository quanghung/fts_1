class Subject < ActiveRecord::Base
  has_many  :questions
  has_many  :exams
  validates :name, presence: true
  validates :time, presence: true
end
