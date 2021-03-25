class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip
      t.string :code
      t.string :street
      t.string :address
      t.string :neighborhood
      t.string :uf
      t.string :ibge
      t.string :gia
      t.string :ddd
      t.string :siafi
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
