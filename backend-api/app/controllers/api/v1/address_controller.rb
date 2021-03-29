class Api::V1::AddressController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    @addresses = current_api_v1_user.addresses
    render json: @addresses, status: :ok
  end
  

  def search
    @address = SearchAddress::AddressFinder.new(params[:zip_code])
    create(@address)
  end

  def create(search)
    values = search.values
    service = SearchAddress::AddressRegister.new(values, current_api_v1_user)
    service.call
    unless service.errors.any?
      render json: serialize(service.address), status: :ok
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end
  
  

  private
  def search_params
    params.require(:address).permit(:zip_code)
  end

  def address_params
    params.require(:address).permit(:zip_code, :street, :complement, 
                           :neighborhood, :locality, :uf, 
                           :ibge, :gia, :ddd, :siafi, :user_id)
  end
  

  def serialize(object, options = {})
    Api::V1::AddressSerializer.new(object, options).serialized_json
  end
  
end