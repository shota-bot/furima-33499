FactoryBot.define do
  factory :postage do
    id   {Faker::Number.between(from: 2, to: 3)}
  end
end
