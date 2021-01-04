require 'faker'
Faker::Config.locale = :ja

puts Faker::Name.last_name
puts Faker::Name.first_name
puts Faker::Name.initials(number: 2)
puts Faker::Internet.free_email
puts Faker::Internet.password(min_length: 6)