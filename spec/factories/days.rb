FactoryBot.define do
  factory :day do
    id   {Faker::Number.between(from: 2, to: 4)}
  end
end
