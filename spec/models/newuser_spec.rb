require 'rails_helper'

RSpec.describe Newuser, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:projects) }
    it { is_expected.to have_many(:developers) }
  end

  describe 'validations' do
    subject { build(:newuser) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
