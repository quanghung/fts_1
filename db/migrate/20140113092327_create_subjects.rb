class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string "name", limit: 512, null: false
      t.time "time", null: false
      t.integer  "number_choice",                          null: false
      t.integer  "number_text",                          null: false
      t.timestamps
    end
    add_index "subjects", ["id"], unique: true
  end
end
