class AddCatToAdoptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :adoptions, :cat, foreign_key: true
  end
end
