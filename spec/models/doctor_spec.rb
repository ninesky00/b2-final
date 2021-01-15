require 'rails_helper'

RSpec.describe Doctor, type: :model do 
  describe "relations" do 
    it { should belong_to :hospital }
    it { should have_many :surgery_doctors}
    it { should have_many :surgeries}
  end
end
