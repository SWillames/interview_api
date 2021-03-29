FactoryBot.define do
  factory :address do
    
    zip_code { (rand(01000000..99999999).to_s) }
    street { Faker::Address.street_address }
    neighborhood { "Center" }
    uf { Faker::Address.state_abbr }
    ibge { "54687" }
    gia { "0045" }
    ddd { "11" }
    siafi { "7107" }
    user { create(:user) }
  end
end
