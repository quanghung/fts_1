class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.string   "text",         limit: 512,                null: false
      t.boolean  "status",                    default: false, null: false
      t.integer  "question_id",                          null: false
      t.timestamps
    end
     add_index "answer_choices", ["id"], unique: true
    add_index "answer_choices", ["question_id"], name: "index_answer_choices_on_question_id_and_created_at"
  end
end
