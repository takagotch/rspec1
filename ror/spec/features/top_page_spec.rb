require 'spec_helper'

describe 'toppage' do
  specify 'msg' do
    visit root_path
    expect(page).to have_css('p', text: 'Hello World!')
  end
end

