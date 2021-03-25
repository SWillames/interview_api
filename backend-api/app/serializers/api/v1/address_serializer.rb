class Api::V1::AddressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :zip, :code, :street, :address, :neighborhood, 
             :uf, :ibge, :gia, :ddd, :siafi, :user_id
end
