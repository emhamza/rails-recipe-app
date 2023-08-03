require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(
      name: 'Naledi',
      email: 'naledi@test.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now, confirmation_sent_at: Time.now
    )
    @food = Food.create(
      name: 'Tufo',
      measurement_unit: 'KG',
      price: 20.00,
      quantity: 4,
      user_id: @user.id
    )
    sign_in @user
  end

  describe '#index' do
    before(:each) do
      visit foods_path
    end

    it 'should display food name' do
      expect(page).to have_content(@food.name)
    end

    # it 'should display food details' do
    #   expect(page).to have_content(@food.measurement_unit)
    #   expect(page).to have_content("$#{format('%.2f', @food.price)}")
    #   expect(page).to have_content(@food.quantity)
    # end

    it 'on clicking on a food, should redirect to that food show page' do
      click_on @food.name
      expect(page).to have_current_path(food_path(@food))
    end
  end

  describe '#show' do
    before(:each) do
      visit food_path(@food)
    end

    it 'should display food name' do
      expect(page).to have_content(@food.name)
    end

    # it 'should display food details' do
    #   expect(page).to have_content(@food.measurement_unit)
    #   expect(page).to have_content("$#{format('%.2f', @food.price)}")
    #   expect(page).to have_content(@food.quantity)
    # end
  end

  #   describe '#new' do
  #     before(:each) do
  #       visit new_food_path
  #     end

  #     it 'should display the new food form' do
  #       expect(page).to have_selector('form#new_food')
  #     end

  #   end

  describe '#destroy' do
    it 'should delete the food' do
      visit foods_path

      expect(page).to have_content(@food.name)

      click_on 'Delete'

      expect(page).to have_current_path(foods_path)
      expect(page).not_to have_content(@food.name)
    end
  end
end
