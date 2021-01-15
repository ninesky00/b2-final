require 'rails_helper'

RSpec.describe "Surgery" do 
  before :each do 
    @surgery = FactoryBot.create(:surgery, day: :tuesday)
    @other_surgeries = FactoryBot.create_list(:surgery, 3, day: :tuesday)
    @not_on_same_day = FactoryBot.create_list(:surgery, 3, day: :friday)
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
  end
end