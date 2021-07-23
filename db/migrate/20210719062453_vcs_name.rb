class VcsName < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_level, :integer
    add_column :users, :vsc_address, :string
  end
end
