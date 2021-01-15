FactoryBot.define do
  factory :surgery_doctor, class: SurgeryDoctor do
    association :doctor
    association :surgery
  end
end
