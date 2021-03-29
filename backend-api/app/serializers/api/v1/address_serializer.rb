class Api::V1::AddressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :zip_code, :street, :neighborhood, 
             :uf, :ibge, :gia, :ddd, :siafi, :user, :complement

  attribute :user do |object|
    object.user.id
    object.user.name
  end
end
