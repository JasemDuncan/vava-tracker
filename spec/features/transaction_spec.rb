require 'rails_helper'

RSpec.feature 'Transaction', type: :feature do
  context 'context' do
    before do
      @yaser = User.create(email: 'yaser@gmail.com', name: 'Yaser', password: '123456')
      visit 'http://localhost:3000/users/sign_in'
      fill_in 'Email', with: 'yaser@gmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    scenario 'Create a subject' do
      visit 'http://localhost:3000/transactions/new'

      fill_in 'transaction_name', with: 'Intro 1'
      fill_in 'transaction_amount', with: '2'
      click_on 'Save subject'    
      expect(page).to have_content("Intro 1")
    end


    scenario 'List all my subjects' do
      visit 'http://localhost:3000/transactions/new'
      fill_in 'transaction_name', with: 'Intro 1'
      fill_in 'transaction_amount', with: '2'
      click_on 'Save subject'    
      visit 'http://localhost:3000/transactions'      
      expect(page).to have_content("2 Hours")
    end

  end
end