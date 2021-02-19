require 'rails_helper'

RSpec.describe 'Logins', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'should login a user who already have an account' do
    u = User.create(name: 'lydia')
    visit root_url
    click_link_or_button 'Sign In'
    fill_in 'Name', with: u.name
    click_link_or_button 'Sign In'
    expect(page).to have_css('img.avatar', count: 1)
  end

  it 'should display a login flash message' do
    u = User.create(name: 'lydia')
    visit root_url
    click_link_or_button 'Sign In'
    fill_in 'Name', with: u.name
    click_link_or_button 'Sign In'
    expect(page).to have_content 'Successfully Logged In!'
  end

  it 'should not login a user who does not exist' do
    visit root_url
    click_link_or_button 'Sign In'
    fill_in 'Name', with: 'delice'
    click_link_or_button 'Sign In'
    expect(page).to have_content 'Name not found!'
  end

  it 'should not login a user who does not provide a name' do
    visit root_url
    click_link_or_button 'Sign In'
    fill_in 'Name', with: nil
    click_link_or_button 'Sign In'
    expect(page).to have_content 'Name not found!'
  end

  it 'signs out logged in user' do
    user = User.create(name: 'lydia')
    visit root_url
    click_link_or_button 'Sign In'
    fill_in 'Name', with: user.name
    click_link_or_button 'Sign In'
    expect(page).to have_css('img.avatar', count: 1)
    click_link_or_button 'Logout'
    expect(page).to have_css('h1.home-title', count: 1, text: 'Grouping Hours App')
  end

  it 'signs out logged in user with a message' do
    user = User.create(name: 'lydia')
    visit root_url
    click_link_or_button 'Sign In'
    fill_in 'Name', with: user.name
    click_link_or_button 'Sign In'
    expect(page).to have_css('img.avatar', count: 1)
    click_link_or_button 'Logout'
    expect(page).to have_content 'Successfully Logged Out!'
  end
end
