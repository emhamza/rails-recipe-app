require 'rails_helper'
RSpec.describe 'Recipes', type: :system do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(
      name: 'Naledi',
      email: 'naledi@test.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now, confirmation_sent_at: Time.now
    )
    @recipe = Recipe.create(
      name: 'bryani',
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
      visit recipes_path
    end
    # it 'should display recipe name' do
    #   assert_text @recipe.name
    # end
    it 'should display recipe description' do
      assert_text @recipe.description
    end
    it 'on clicking on a recipe, should redirect to that recipe show page' do
      click_on @recipe.name
      assert_current_path recipe_path(@recipe)
    end
  end
  describe '#show' do
    before(:each) do
      visit recipe_path(@recipe)
    end
    scenario 'should display recipe name' do
      assert_text @recipe.name
    end
    scenario 'should display recipe description' do
      assert_text @recipe.description
    end
    # scenario 'Click on New Recipe, should redirect to the ingredient page' do
    #   click_on 'New Recipe'
    #   assert_current_path recipe_path(@recipe)
    # end
    # scenario 'on clicking the Generate shopping list, should redirect to that general shopping list page' do
    #   click_on 'Generate Shopping List'
    #   assert_current_path shopping_list_recipe_path(@recipe)
    # end
  end
end
