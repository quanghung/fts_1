class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string   "name",            limit: 512,                null: false
      t.string   "email",                                      null: false
      t.string   "password_digest", limit: 256,                null: false
      t.string   "remember_token"
      t.timestamps 
    end
    add_index "admins", ["id"], unique: true
    add_index "admins", ["email"], name: "index_admins_on_email", unique: true
    add_index "admins", ["remember_token"], name: "index_users_on_remember_token"
  end
end
