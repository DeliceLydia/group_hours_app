require 'rails_helper'

RSpec.describe 'Signups', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'should create a new account' do
    visit root_url
    click_link_or_button 'Signup'
    fill_in "Name", with: 'lydia'
    click_link_or_button 'Sign Up'
    expect(page).to have_css('img.avatar', count: 1)
  end

  it 'should display a flash message' do
    visit root_url
    click_link_or_button 'Signup'
    fill_in "Name", with: 'lydia'
    click_link_or_button 'Sign Up'
    expect(page).to have_content "Signed Up successfully!"
  end

  it 'should not signup a user who did not provide a name' do
    visit root_url
    click_link_or_button 'Signup'
    fill_in "Name", with: nil
    click_link_or_button 'Sign Up'
    expect(page).to have_content "[\"Name can't be blank\", \"Name is too short (minimum is 3 characters)\"]"
  end

  it 'should not signup a user who provide a  short name' do
    visit root_url
    click_link_or_button 'Signup'
    fill_in "Name", with: 'li'
    click_link_or_button 'Sign Up'
    expect(page).to have_content "Name is too short (minimum is 3 characters)"
  end


  it 'should not signup who use a name already exist' do
    u = User.create(name: 'lydia')
    visit root_url
    click_link_or_button 'Signup'
    fill_in "Name", with: u.name
    click_link_or_button 'Sign Up'
    expect(page).to have_content 'Name has already been taken'
  end
 end