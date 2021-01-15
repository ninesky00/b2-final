FactoryBot.define do
  factory :doctor, class: Doctor do
    name { Faker::Science.scientist }
    association :hospital
    specialty { Faker::Game.genre }
    university { Faker::University.name }
  end
end
