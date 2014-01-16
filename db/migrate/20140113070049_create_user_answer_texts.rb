class CreateUserAnswerTexts < ActiveRecord::Migration
  def change
    create_table :user_answer_texts do |t|
      t.integer  "question_id",                     null: false
      t.integer  "user_test_id",           null: false
      t.string   "text",                          null: false
      t.timestamps
    end
    add_index "user_answer_texts", ["id"], unique: true
    add_index "user_answer_texts", ["question_id"], name: "index_user_answer_texts_on_question_id_and_created_at"
  end
end