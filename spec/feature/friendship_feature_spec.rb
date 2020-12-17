require 'rails_helper'
RSpec.feature 'Friendship invitation', type: :feature do
  before(:each) do
    @a = User.create(name: 'a', email: 'a@a.com', password: '123456')
    @b = User.create(name: 'b', email: 'b@b.com', password: '123456')
  end
  scenario 'invite a user for friendship' do
    visit 'users/sign_in'
    fill_in 'user[email]',with: 'a@a.com'
    fill_in 'user[password]',with: '123456'
    click_button 'Log in'
    visit 'users'
    click_button 'Invite'
    expect(page).to have_text('Invitation sent successfully!')
  end
end
RSpec.feature 'Invitation cancelation', type: :feature do
  before(:each) do
    @a = User.create(name: 'a', email: 'a@a.com', password: '123456')
    @b = User.create(name: 'b', email: 'b@b.com', password: '123456')
  end
  scenario 'Cancel pending invitation' do
    visit 'users/sign_in'
    fill_in 'user[email]',with: 'a@a.com'
    fill_in 'user[password]',with: '123456'
    click_button 'Log in'
    visit 'users'
    click_button 'Invite'
    click_button 'Cancel'
    visit 'users'
  end
end
RSpec.feature 'Invitation acceptence', type: :feature do
  before(:each) do
    @a = User.create(name: 'a', email: 'a@a.com', password: '123456')
    @b = User.create(name: 'b', email: 'b@b.com', password: '123456')
  end
  scenario 'Accept an invitation' do
    visit 'users/sign_in'
    fill_in 'user[email]',with: 'a@a.com'
    fill_in 'user[password]',with: '123456'
    click_button 'Log in'
    visit 'users'
    click_button 'Invite'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'user[email]',with: 'b@b.com'
    fill_in 'user[password]',with: '123456'
    click_button 'Log in'
    visit 'users'
    expect(page).to have_text('a')
    click_button 'Accept'
    visit 'users'
  end
end
RSpec.feature 'Invitation Rejection', type: :feature do
  before(:each) do
    @a = User.create(name: 'a', email: 'a@a.com', password: '123456')
    @b = User.create(name: 'b', email: 'b@b.com', password: '123456')
  end
  scenario 'Reject an invitation' do
    visit 'users/sign_in'
    fill_in 'user[email]',with: 'a@a.com'
    fill_in 'user[password]',with: '123456'
    click_button 'Log in'
    visit 'users'
    click_button 'Invite'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'user[email]',with: 'b@b.com'
    fill_in 'user[password]',with: '123456'
    click_button 'Log in'
    visit 'users'
    expect(page).to have_text('a')
    click_button 'Reject'
    visit 'users'
  end
end
