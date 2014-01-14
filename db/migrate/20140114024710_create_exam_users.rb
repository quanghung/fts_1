class CreateExamUsers < ActiveRecord::Migration
  def change
    create_table :exam_users do |t|
      t.integer  "exam_id",                          null: false
      t.integer  "user_id",                             null: false
      t.boolean  "status_exam_user"                            
      t.timestamps
    end
    add_index "exam_users", ["id"], unique: true
    add_index "exam_users", ["exam_id"], name: "index_exam_users_on_exam_id_and_created_at" 
    add_index "exam_users", ["user_id"], name: "index_exam_users_on_user_id_and_created_at"
  end
end
