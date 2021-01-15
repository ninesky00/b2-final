FactoryBot.define do
  factory :hospital, class: Hospital do
    name {Faker::Company.name}
  end
end
