PASSWORD = "123456"

users_list = [
  {name: "Nguyen Van A", position_id: 3,
    email: "a@framgia.com", 
    password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van B", position_id: 2,
    email: "b@framgia.com", 
    password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van C", position_id: 3,
    email: "c@framgia.com", 
    password: PASSWORD,
    password_confirmation: PASSWORD},
]

users_list.each do |user|
  User.create! user
end

admins_list = [
  {name: "Admin", position_id: 2,
    email: "admin@framgia.com",
    password: PASSWORD,
    password_confirmation: PASSWORD},
]

admins_list.each do |admin|
  Admin.create! admin
end

exams_list = [
  {name: "Exam 1",subject_id:1},
  {name: "Exam 2",subject_id:2},
  {name: "Exam 3",subject_id:1},
]

exams_list.each do |exam|
  Exam.create! exam
end

results_list = [
  {mark:6,subject_id: 1, user_id: 1, exam_id: 1},
  {mark:8,subject_id: 1, user_id: 2, exam_id: 2},
  {mark:9,subject_id: 1, user_id: 2, exam_id: 3},
  {mark:4,subject_id: 2, user_id: 3, exam_id: 1},
  {mark:5,subject_id: 2, user_id: 4, exam_id: 1}
]

results_list.each do |result|
  Result.create! result
end

exam_questions_list = [
 {question_id:6,subject_id: 1,exam_id: 1},
 {question_id:6,subject_id: 1,exam_id: 1}
]

exam_questions_list_list.each do |exam_question|
  ExamQuestion.create! exam_question
end


questions_list = [
  {questiontext: "question 1",type:0,subject_id:1},
  {questiontext: "question 2",type:0,subject_id:1},
  {questiontext: "question 3",type:1,subject_id:1},
  {questiontext: "question 4",type:1,subject_id:1},
  {questiontext: "question 5",type:1,subject_id:1},
  {questiontext: "question 6",type:0,subject_id:1},
]

questions_list.each do |question|
  Question.create! question
end

subjects_list = [
  {name: "Mysql", time: 25},
  {name: "Git", time: 25},
  {name: "Java", time: 25},
  {name: "Ruby on Rails", time: 25},
  {name: "Mysql Ex", time: 60},


subjects_list.each do |subject|
  Subject.create! subject



answer_choices_list = [
  {text: "choice 1", status: 1,question_id: 1},
  {text: "choice 2", status: 0,question_id: 1},
  {text: "choice 3", status: 0,question_id: 1},
  {text: "choice 4", status: 0,question_id: 1},
  {text: "choice 1", status: 1,question_id: 2},
  {text: "choice 2", status: 0,question_id: 2},
  {text: "choice 3", status: 0,question_id: 3},
  {text: "choice 4", status: 0,question_id: 4},
]

answer_choices_list.each do |answer_choice|
  AnswerChoice.create! answer_choice
end
answer_choices_list = [
  {text: "choice 1",question_id: 1},
  {text: "choice 2",question_id: 1},
  {text: "choice 3",question_id: 1},
  {text: "choice 4",question_id: 1},
  {text: "choice 1",question_id: 2},
  {text: "choice 2",question_id: 2},
  {text: "choice 3",question_id: 3},
  {text: "choice 4",question_id: 4},
]

answer_texts_list.each do |answer_text|
  AnswerText.create! answer_text