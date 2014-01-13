class Subject < ActiveRecord::Base
  has_many  :questions
  validates :name, presence: true
  validates :time, presence: true
end
