class SearchAddress::AddressRegister
  attr_accessor :errors
  attr_accessor :address
  def initialize(values, user)
    @user = user
    @values = values
    @address
    @errors = []
  end

  def call
    address_register!
  end

  def address_register!
    ActiveRecord::Base.transaction do
      @address = build_address
      if @address.valid? && @address.save
        @address
      else
        @errors = (@address.errors.full_messages)
      end
    end
  end
  
  
  def build_address
    zip = @values[0].gsub!('-','')
    @address = Address.new(zip_code: zip, street: @values[1], complement: @values[2], 
                           neighborhood: @values[3], locality: @values[4], uf: @values[5], 
                           ibge: @values[6], gia: @values[7], ddd: @values[8], siafi: @values[9], user: @user)
    @address
  end
  
end