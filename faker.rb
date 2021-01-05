require 'faker'
Faker::Config.locale = :ja

puts Faker::Lorem.word
puts Faker::Number.between(from: 300, to: 9999999)