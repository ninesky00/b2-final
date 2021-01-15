class Surgery < ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors
  enum day: %i(monday tuesday wednesday thursday friday)

  def doctor_names
    doctors.pluck(:name)
  end

  def self.surgeries_on_same_day(day)
    select("title").where(day: "#{day}").pluck(:title)
  end
end