class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :gender
      t.string :age
      t.string :img_url

      t.timestamps
    end
  end
end
