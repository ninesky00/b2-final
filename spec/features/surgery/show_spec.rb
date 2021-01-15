require 'rails_helper'

RSpec.describe "Surgery" do 
  before :each do 
    @surgery = FactoryBot.create(:surgery, day: :tuesday)
    @other_surgeries = FactoryBot.create_list(:surgery, 2, day: :tuesday)
    @not_on_same_day = FactoryBot.create_list(:surgery, 2, day: :friday)
  end
  describe "show page" do 
    it "has a link from the surgery index page" do 
      visit surgeries_path

      click_on "#{@surgery.title}"
      expect(current_path).to eq(surgery_path(@surgery))
    end

    it "displays surgery attributes" do 
      visit surgery_path(@surgery)
      expect(page).to have_content(@surgery.title)
      expect(page).to have_content(@surgery.day)
      expect(page).to have_content(@surgery.room_number)
    end

    it "displays all surgeries happening on the same day of the week" do 
      visit surgery_path(@surgery)

      within("#other-surgeries") do 
        @other_surgeries.each do |surgery|
          expect(page).to have_content(surgery.title)
        end

        @not_on_same_day.each do |surgery|
          expect(page).to_not have_content(surgery.title)
        end
      end
    end

    it "displays a field to add a doctor to this surgery" do 
      doctor = FactoryBot.create(:doctor)
      visit surgery_path(@surgery)
      

      expect(page).to have_content("Add A Doctor To This Surgery")
      fill_in "doctor", with: doctor.name
      click_on "Save"
      expect(current_path).to eq(surgery_path(@surgery))
      expect(page).to have_content(doctor.name)
    end
  end
end