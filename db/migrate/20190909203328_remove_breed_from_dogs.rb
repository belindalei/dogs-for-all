class RemoveBreedFromDogs < ActiveRecord::Migration[6.0]
  def change
    remove_column :dogs, :breed, :string
  end
end
