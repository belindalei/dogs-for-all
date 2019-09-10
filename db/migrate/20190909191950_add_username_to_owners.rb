class AddUsernameToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :username, :string
  end
end
