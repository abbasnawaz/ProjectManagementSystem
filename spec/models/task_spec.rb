require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:project) }
    it { should belong_to(:developer) }
  end

  describe 'validations' do
    subject { build(:tasks) }
    it { should validate_presence_of(:ending_date) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(20).is_at_most(200) }
    it { should validate_presence_of(:task_type) }
    it { should validate_presence_of(:ticketNo) }
    it { should validate_numericality_of(:priority).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(10) }
  end

  describe 'enums' do
    it { should define_enum_for(:task_type).with_values([:feature, :bug]) }
  end
end
