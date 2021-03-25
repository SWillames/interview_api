class UpdateInTheAddress < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :address
    add_column :addresses, :locality, :string
  end
end
