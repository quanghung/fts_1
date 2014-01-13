class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string   "name",         limit: 512,                null: false
      t.integer   "time",                                    null: false 
 end

    add_index "subjects", ["id"], unique: true
  end
end
    