# spec/models/project_spec.rb
require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should belong_to(:newuser).with_foreign_key('newuser_id') }
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    subject { build(:project) }

    it { should validate_presence_of(:project_name) }
    it { should validate_uniqueness_of(:project_name).case_insensitive }
    it { should validate_presence_of(:starting_date) }
    it { should validate_presence_of(:ending_date) }
  end
end
