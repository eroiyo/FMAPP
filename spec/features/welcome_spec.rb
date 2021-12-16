# frozen_string_literal: true

describe 'The Plash Page', type: :feature do
  it 'If i visit anywhere without logging it return me back to login.' do
    visit '/categories/1'
    expect(current_path).to eq('/users/sign_in')
  end

  it 'When I click the login button I am redirected to the login page, ' do
    visit '/'
    click_link 'Log in'
    expect(current_path).to eq('/users/sign_in')
  end

  it 'When I click the sign up button I am redirected to the sign up page, ' do
    visit '/'
    click_link 'Sign up'
    expect(current_path).to eq('/users/sign_up')
  end
end
