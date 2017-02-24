require 'rails_helper'

feature 'reviewing' do
  # let!(:mcdonalds){ Restaurant.create(name:'McDonalds') }

  scenario 'allows users to leave a review using a form' do
    sign_up
    @user.restaurants.create(name: 'KFC')
    click_link 'Sign out'
    sign_up_with_another_user
    leave_review('aight', 1)
    click_link 'KFC'
    expect(page).to have_content('aight')
  end

  scenario 'displays an average rating for all reviews' do
    sign_up
    @user.restaurants.create(name: 'KFC')
    leave_review('So so', '3')
    click_link 'Sign out'
    sign_up_with_another_user
    leave_review('Great', '5')
    click_link 'KFC'
    expect(page).to have_content('Average rating: 4')
  end

end
