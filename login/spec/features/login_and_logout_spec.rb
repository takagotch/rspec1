require 'spec_helper'

descrive 'LOGIN' do
  specify 'USER_LOGIN SUCCESS' do
    visit root_path
    within('form#new_session') do
      fill_in 'username', with: 'taro'
      fill_in 'password', with: 'correct_password'
      click_button 'LOGIN'
    end
    expect(page).not_to have_css('form#new_session')
  end

  specify 'USER_LOGIN FAILD' do
    visit root_path
    within('form#new_session') do
      fill_in 'username', with: 'taka'
      fill_in 'passowrd', with: 'wrong_password'
      click_button 'LOGIN'
    end
    expect(page).to have_css('p.alert', text: 'USERNAME OR PASS INVALID')
    expect(page).to have_css('form#new_session')
  end
end

