class CreateAnswerTexts < ActiveRecord::Migration
  def change
    create_table :answer_texts do |t|
      t.string   "text",         limit: 512,                null: false
      t.integer  "question_id",                          null: false
      t.timestamps
    end
    add_index "answer_texts", ["id"], unique: true
    add_index "answer_texts", ["question_id"], name: "index_answer_texts_on_question_id_and_created_at"
  end
end
