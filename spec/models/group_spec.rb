require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do    
    it { should have_one_attached(:image) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations of name' do
    it { should validate_presence_of(:name) }
  end

  describe 'validations of image' do
    it { should validate_presence_of(:image) }
  end

end