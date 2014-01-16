class CreateUserAnswerChoices < ActiveRecord::Migration
  def change
    create_table :user_answer_choices do |t|
      t.integer  "question_id",                     null: false
      t.integer  "user_test_id",           null: false
      t.boolean  "status",                          null: false
      t.timestamps
    end
    add_index "user_answer_choices", ["id"], unique: true
    add_index "user_answer_choices", ["question_id"], name: "index_user_answer_choices_on_question_id_and_created_at"
  end
end
