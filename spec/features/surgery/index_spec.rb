require 'rails_helper'

RSpec.describe "Surgery" do 
  before :each do 
    @surgeries = FactoryBot.create_list(:surgery, 4)
    @docs = FactoryBot.create_list(:doctor, 4)
    @surg_docs1 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[0].id, surgery_id: @surgeries[0].id)
    @surg_docs2 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[1].id, surgery_id: @surgeries[0].id)
    @surg_docs3 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[2].id, surgery_id: @surgeries[0].id)
    @surg_docs4 = FactoryBot.create(:surgery_doctor, doctor_id: @docs[3].id, surgery_id: @surgeries[0].id)
    visit surgeries_path
  end
  describe "index page" do 
    it "displays the title of all surgeries" do 
      @surgeries.each do |surgery|
        expect(page).to have_content(surgery.title)
      end  
    end

    it "displays the names of all doctors performing each surgery" do 
      within("#surgery-#{@surgeries[0].id}") do 
        expect(page).to have_content(@surg_docs1.doctor.name)
        expect(page).to have_content(@surg_docs2.doctor.name)
        expect(page).to have_content(@surg_docs3.doctor.name)
        expect(page).to have_content(@surg_docs4.doctor.name)
      end
    end
  end
end