require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
  describe 'validations of name' do
    it { should validate_presence_of(:name) }
  end

  describe 'validations of amount' do
    it { should validate_presence_of(:amount) }
  end
end
