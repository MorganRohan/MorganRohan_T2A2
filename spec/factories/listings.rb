FactoryBot.define do
  factory :listing do
    title { "MyString" }
    description { nil }
    condition { "MyText" }
    price { 1 }
    sold { false }
    account { nil }
    category { nil }
  end
end
