# frozen_string_literal: true

describe 'The User Show Process', type: :feature do
  before :each do
    @user = User.new
    @user.last_name = '#130'
    @user.first_name = 'User_'
    @user.email = 'test130@example.com'
    @user.password = 'taawktljasktlw4aaglj'
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

  it 'I can see the Categories Title.' do
    visit '/categories'

    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)

    expect(page).to have_content 'CATEGORIES'
  end

  it 'I can see a category title of the user.' do
    visit '/categories'
    expect(page).to have_content @user.categories[0].name

    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)
  end

  it 'I can see The total of a category.' do
    visit '/categories'
    expect(page).to have_content @user.categories[0].total

    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)
  end

  it 'I can see The date of a category.' do
    visit '/categories'
    expect(page).to have_content @user.categories[0].updated_at

    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)
  end

  it 'If i click on a category, it redirect me to the category page.' do
    visit '/categories'
    click_on @user.categories[0].name
    id = @user.categories[0].id

    expect(current_path).to eq("/categories/#{id}")
    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)
  end

  it 'If i click on CREATE A NEW CATEGORY, it redirect me to the category creation page.' do
    visit '/categories'
    click_on 'ADD A NEW CATEGORY'

    expect(current_path).to eq('/categories/create')
    Deductible.destroy_by(user_id: @user.id)
    Category.destroy_by(user_id: @user.id)
    User.destroy(@user.id)
  end
end
