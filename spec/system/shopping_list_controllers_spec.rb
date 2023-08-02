require 'rails_helper'

RSpec.describe 'Shopping List', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(
      name: 'Naledi',
      email: 'naledi@test.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now,
      confirmation_sent_at: Time.now
    )

    @recipe = Recipe.create(
      name: 'biryani',
      preparation_time: 10,
      cooking_time: 20,
      description: 'cook it well',
      public: false,
      user_id: @user.id
    )

    sign_in @user
  end

  describe '#index' do
    before(:each) do
      visit shopping_list_path
    end

    it 'should display recipe name in the shopping list' do
      assert_text @recipe.name
    end

    it 'should display recipe description in the shopping list' do
      assert_text @recipe.description
    end

    it 'on clicking on a recipe, should redirect to that recipe show page' do
      click_on @recipe.name
      expect(page).to have_current_path(recipe_path(@recipe))
    end
  end

  describe '#show' do
    before(:each) do
      visit shopping_list_recipe_path(@recipe)
    end

    scenario 'should display recipe name' do
      assert_text @recipe.name
    end

    scenario 'should display recipe description' do
      assert_text @recipe.description
    end

    # Add more scenarios as needed
  end
end
