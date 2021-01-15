class Surgery < ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors
  enum day: %i(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  def doctor_names
    doctors.pluck(:name)
  end
end