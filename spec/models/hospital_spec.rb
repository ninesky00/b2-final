require 'rails_helper'

RSpec.describe Hospital, type: :model do 
  describe "relations" do 
    it { should have_many :doctors }
  end
end
