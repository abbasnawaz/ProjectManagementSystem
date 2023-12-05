require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'associations' do
    it { should belong_to(:newuser).with_foreign_key('newuser_id') }
    it { should have_one(:task) }
  end

  describe 'validations' do
    subject { build(:developers) }
    it { should validate_presence_of(:specilization) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:phoneNo) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'callbacks' do
    it 'should normalize phone number before saving' do
      developer = create(:developers, phoneNo: '1234567890')
      expect(developer.phoneNo).to eq('+921234567890')
    end
  end
end
