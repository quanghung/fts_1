class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer  "mark"                        
      t.integer  "user_id",                          null: false
      t.integer  "exam_id",                          null: false
      t.integer  "subject_id",                          null: false
      t.timestamps
    end
    add_index "results", ["id"], unique: true
    add_index "results", ["user_id"], name: "index_results_on_user_id_and_created_at"
    add_index "results", ["exam_id"], name: "index_results_on_exam_id_and_created_at"
    add_index "results", ["subject_id"], name: "index_results_on_subject_id_and_created_at"
  end
end
