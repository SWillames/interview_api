FactoryBot.define do
  factory :address do
    zip_code { "MyString" }
    street { "MyString" }
    address { "MyString" }
    neighborhood { "MyString" }
    uf { "MyString" }
    ibge { "MyString" }
    gia { "MyString" }
    ddd { "MyString" }
    siafi { "MyString" }
    user { nil }
  end
end
