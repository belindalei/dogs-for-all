class DropAdoptionsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :adoptions do |t|
      t.integer "owner_id", null: false
      t.integer "dog_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "cat_id"
      t.index ["cat_id"], name: "index_adoptions_on_cat_id"
      t.index ["dog_id"], name: "index_adoptions_on_dog_id"
      t.index ["owner_id"], name: "index_adoptions_on_owner_id"
    end
  end
end
