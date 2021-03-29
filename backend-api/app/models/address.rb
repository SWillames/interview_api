class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :zip_code, :street, :neighborhood, :user
  validates_format_of :zip_code, with: /\A.[0-9]+\z/
  validates_length_of :zip_code, is: 8

  def as_json(options = {})
    ({
      id: id,
      zip_code: zip_code,
      street: street,
      neighborhood: neighborhood,
      uf: uf,
      ibge: ibge,
      gia: gia,
      ddd: ddd,
      siafi: siafi,
      user: user.name,
      locality: locality,
      complement: complement
    })
  end
  
end
