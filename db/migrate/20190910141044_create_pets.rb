class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :type
      t.string :name
      t.string :age
      t.string :img_url
      t.string :gender

      t.timestamps
    end
  end
end
