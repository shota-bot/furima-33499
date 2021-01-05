require 'faker'

FactoryBot.define do
  factory :item do
    Faker::Config.locale = :ja
    name    { Faker::Lorem.word }
    text    { Faker::Lorem.sentence }
    price   { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    association :category
    association :status
    association :postage
    association :prefecture
    association :day

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
