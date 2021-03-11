FactoryBot.define do
  factory :item do
    name {Faker::Commerce.name}
    info {Faker::Lorem.sentence}
    association :user
    category_id {2}
    status_id {2}
    cost_id {2}
    area_id {2}
    furimadate_id {2}
    price {300}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
