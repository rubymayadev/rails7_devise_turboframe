require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'validation tests' do
    let(:profile) { create(:profile) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:email_address) }
    it { should validate_length_of(:first_name).is_at_most(25) }
    it { should validate_length_of(:last_name).is_at_most(50) }
    
    it "should validate email pattern" do
      expect(profile.email_address).to match(/\A\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)\z/i)
    end
  end

  context "Associations" do
    it { should have_many(:employers) }
  end
end