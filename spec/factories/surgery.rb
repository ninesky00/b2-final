FactoryBot.define do
  factory :surgery, class: Surgery do
    title { Faker::Food.dish }
    day { %i(Monday Tuesday Wednesday Thursday Friday).sample }
    room_number { Faker::Number.within(range: 1..100) }
  end
end
