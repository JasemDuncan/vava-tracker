require 'rails_helper'

RSpec.describe 'Test log in and sign up', type: :feature, feature: true do
  context 'context' do
    before do
      @hans = User.create(email: 'hans@gmail.com', name: 'hans', password: '123456')
      @yaser = User.create(email: 'yaser@gmail.com', name: 'yaser', password: '123456')
      visit 'http://localhost:3000/users/sign_in'
      fill_in 'Email', with: 'hans@gmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end
    scenario 'Test if the user hans@gmail.com can log in' do
      expect(page).to have_content('hans@gmail.com')
    end
    scenario 'Test if Hans logs out' do
      click_on 'Log out'
      expect(page).to have_content('Snapscan')
    end
    scenario 'Test Jan sign up' do
      click_on 'Log out'
      visit 'http://localhost:3000/users/sign_up'
      fill_in 'Email', with: 'jan@gmail.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'
      expect(page).to have_content('jan@gmail.com')
    end
  end
end
