require 'rails_helper'

RSpec.describe Employer, type: :model do
  context 'validation tests' do
    it { should validate_presence_of(:employment) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  context "Associations" do
    it { should belong_to(:profile).without_validating_presence }
  end
end