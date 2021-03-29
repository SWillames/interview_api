require 'rails_helper'

RSpec.describe Address, type: :model do
  context "association" do
    it { is_expected.to belong_to(:user,) }
  end
  

  context "validaions" do
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:user) }

    %w[
		abcdfgh
		123456789ab
		ab145879cxv
		@1a254#$%a!
		12345
		invalid
		].each do |zip_code|
			it "requires #{zip_code} as invalid zip_code" do
				address = Address.create(zip_code: zip_code)
				expect(address.errors[:zip_code].size).to be >= 1
			end
    end
    
    %w[
		123456789
		1234567891011
		154679584651
		14896301746872
		12345
		].each do |zip_code|
			it "requires #{zip_code} as invalid zip_code length" do
				address = Address.create(zip_code: zip_code)
				expect(address.errors[:zip_code].size).to be >= 1
			end
    end
    
    %w[
		12345678
		12345679
		15467954
		14896307
		12345964
		].each do |zip_code|
			it "requires #{zip_code} as valid zip_code length" do
				address = Address.create(zip_code: zip_code)
				expect(address.errors[:zip_code].size).to eq 0
			end
		end
  end
end
