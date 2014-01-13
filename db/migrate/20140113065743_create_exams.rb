class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string   "name",         limit: 512,                null: false
      t.integer  "subject_id",                          null: false
      t.timestamps
    end
    add_index "exams", ["id"], unique: true
    add_index "exams", ["subject_id"], name: "index_exams_on_subject_id_and_created_at"
  end
end
