require 'rails_helper'

RSpec.describe "Api::V1::Addresses", type: :request do
  describe "GET /address" do
    context "With Invalid authentication headers" do
      it_behaves_like :deny_without_authorization, :post, "/api/v1/address"
    end

    context "With valida authentication headers" do 
      before do
        @user = create(:user) 
        @address1 = create(:address, zip_code: '77826215', user: @user) 
        @address2 = create(:address, zip_code: '64800002', user: @user) 
    
        get "/api/v1/address", params: {}, headers: header_with_authentication(@user)
      end

      it "returns 200" do
        expect_status(200)  
      end

      it "return Adress list with 2 addresses" do
        expect(json.count).to eql(@user.addresses.count)
      end

      it "returned Addresses have right datas" do
        expect(json[0]).to eql(JSON.parse(@address1.to_json))
        expect(json[1]).to eql(JSON.parse(@address2.to_json))
      end
    end
    
  end
  

  describe 'POST #create' do
    context "With Invalid authentication headers" do
      it_behaves_like :deny_without_authorization, :post, "/api/v1/address"
    end
    
    context "With valids authentication headers" do
      before do
        @user = create(:user)
        @address = create(:address, zip_code: '77826215', user: @user)
        post "/api/v1/search" , params: {address: {zip_code: @address.zip_code}}, headers: header_with_authentication(@user)
      end

      it "returns 200" do
        expect_status(200)
      end
      
    end
  end
end