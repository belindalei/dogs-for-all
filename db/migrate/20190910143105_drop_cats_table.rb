class DropCatsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :cats do |t|
      t.string "name"
      t.string "gender"
      t.string "age"
      t.string "img_url"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
