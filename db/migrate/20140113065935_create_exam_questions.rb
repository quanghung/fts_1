class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.integer  "exam_id",                          null: false
      t.integer  "question_id",                          null: false
      t.integer  "subject_id",                          null: false
      t.timestamps
    end
    add_index "exam_questions", ["id"], unique: true
    add_index "exam_questions", ["exam_id"], name: "index_exam_questions_on_exam_id_and_created_at"
    add_index "exam_questions", ["question_id"], name: "index_questions_on_question_id_and_created_at"
    add_index "exam_questions", ["subject_id"], name: "index_exam_questions_on_subject_id_and_created_at"
  end
end
