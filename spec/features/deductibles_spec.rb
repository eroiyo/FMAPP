# frozen_string_literal: true

describe 'Deductibles', type: :feature do
  before :each do
    @user = User.new
    @user.last_name = '#130'
    @user.first_name = 'User_'
    @user.email = 'test130@example.com'
    @user.password = 'taawktljasktlw4aaglj'
    @user.skip_confirmation!
    @user.save!

    3.times do |y|
      category = Category.create(name: "Category ##{y + 1} of User#1", user: @user, icon: fixture_file_upload('test.jpg'))
      5.times do |j|
        a = Deductible.create(amount: j + 1, name: "Deductible##{j + 1}", user: @user)
        a.categories << category
        category.deductibles << a
      end
      @user.categories << category
      category.save!
    end

    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'test130@example.com'
      fill_in 'user_password', with: 'taawktljasktlw4aaglj'
    end
    click_button 'Log in'
  end

  it 'I can see the Deductibles name.' do
    visit "/categories/#{@user.categories[0].id}"

    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)

    expect(page).to have_content @user.categories[0].name
  end

  it 'I can see The price of an deductible.' do
    visit "/categories/#{@user.categories[0].id}"

    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)

    expect(page).to have_content @user.categories[0].deductibles[0].amount
  end

  it 'I can see The name of an deductible.' do
    visit "/categories/#{@user.categories[0].id}"

    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)

    expect(page).to have_content @user.categories[0].deductibles[0].name
  end
end
