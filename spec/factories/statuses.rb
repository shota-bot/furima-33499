FactoryBot.define do
  factory :status do
    id   {Faker::Number.between(from: 2, to: 7)}
  end
end
