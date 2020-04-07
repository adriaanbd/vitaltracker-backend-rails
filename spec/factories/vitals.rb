FactoryBot.define do
  factory :vital do
    category { "weight" }
    measure { "140 lbs" }
    user
  end
end
