FactoryBot.define do
  factory :surgery, class: Surgery do
    title { Faker::Food.dish }
    day { %i(monday tuesday wednesday thursday friday).sample }
    room_number { Faker::Number.within(range: 1..100) }
  end
end
