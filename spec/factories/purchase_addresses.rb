FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    area_id {2}
    cities { '横浜市緑区' }
    house_number { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
    token { 'aaa' }
  end
end
