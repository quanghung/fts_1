class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.integer  "question_id",                          null: false
      t.integer  "user_id",                          null: false
      t.integer  "subject_id",                          null: false
      t.timestamps
    end
    add_index "user_tests", ["id"], unique: true
  end
end
