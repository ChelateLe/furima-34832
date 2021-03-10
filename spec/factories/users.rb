FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end 
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name { person.first.kanji}
    last_name { person.last.kanji}
    
  end
end
