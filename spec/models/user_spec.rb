require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    User.create(email: 'yaser@gmail.com', name: 'Yaser', password: '123456')    
    it { should have_many(:groups) }
    it { should have_many(:transactions) }
  end
end
