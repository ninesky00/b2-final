require 'rails_helper'

RSpec.describe "Surgery" do 
  before :each do 
    @surgery = FactoryBot.create(:surgery)
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

  end
end