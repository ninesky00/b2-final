require 'rails_helper'

RSpec.describe "Surgery" do 
  before :each do 
    @surgeries = FactoryBot.create_list(:surgery, 4)
    @docs = FactoryBot.create_list(:doctor, 4)
    @surg_docs1 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[0].id, surgery_id: @surgeries[0].id)
    @surg_docs2 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[1].id, surgery_id: @surgeries[0].id)
    @surg_docs3 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[2].id, surgery_id: @surgeries[0].id)
    @surg_docs4 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[3].id, surgery_id: @surgeries[0].id)
  end
  describe "show page" do 
    it "has a link from the surgery index page" do 
      visit surgeries_path

      click_on "#{@surgeries[0].title}"
      expect(current_path).to eq(surgery_path(@surgeries[0]))
    end



  end
end