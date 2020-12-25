require 'rails_helper'

RSpec.feature 'Group', type: :feature do
  context 'context' do
    before do
      @yaser = User.create(email: 'yaser@gmail.com', name: 'Yaser', password: '123456')
      visit 'http://localhost:3000/users/sign_in'
      fill_in 'Email', with: 'yaser@gmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    scenario 'Create a group' do
      visit 'http://localhost:3000/groups/new'
      fill_in 'group_name', with: 'Group Test'
      click_on 'SAVE GROUP'
    # #   find(:xpath, '//form[@id="new_comment"][@action="/posts/1/comments"]//input[@id="comment_content"]').set('This a comment from Yaser')
    # #   find(:xpath, '//form[@id="new_comment"][@action="/posts/1/comments"]').click_on('Comment')
       expect(page).to have_content("Image can't be blank")
    end
  end
end