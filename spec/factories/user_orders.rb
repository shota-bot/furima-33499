FactoryBot.define do
  factory :user_order do
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"aa"}
    house_num {"bb"}
    building {"cc"}
    phone_num {"12345678910"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
