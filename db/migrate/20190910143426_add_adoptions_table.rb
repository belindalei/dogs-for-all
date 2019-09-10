class AddAdoptionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :adoptions do |t|
      t.integer "owner_id", null: false
      t.integer "pet_id", null: false
    end
  end
end
