require 'rails_helper'

RSpec.describe Surgery, type: :model do 
  describe "relations" do 
    it { should have_many :surgery_doctors }
    it { should have_many :doctors}
  end
end
