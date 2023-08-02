# # require 'rails_helper'
# # require 'faker'

# # RSpec.describe Recipe, type: :model do
# #   naledi = User.create!(name: Faker::Name.unique.name,
# #                         email: Faker::Internet.email,
# #                         password: '1234567', password_confirmation: '1234567')

# #   subject do
# #     Recipe.new(name: 'Chicken',
# #                preparation_time: '1 hr',
# #                cooking_time: '2 hr',
# #                description: 'Yummy Food',
# #                public: false,
# #                user: naledi) # Set the user_id explicitly
# #   end

# #   before { subject.save }

# #   it 'should have a name' do
# #     subject.name = nil
# #     expect(subject).to_not be_valid
# #   end

# #   it 'should have a description' do
# #     subject.description = nil
# #     expect(subject).to_not be_valid
# #   end
# # end
# require 'rails_helper'

# describe Recipe, type: :model do
#   before :each do
#     @user = User.create(name: 'user01', email: 'user01@gmail.com', password: 'password01')
#     @recipe = Recipe.create(
#       user: @user,
#       name: 'Recipe 1',
#       preparation_time: 8,
#       cooking_time: 23,
#       description: 'Description 01'
#     )
#   end

#   it 'Recipe model field should be equal to test recipe' do
#     expect(@recipe.name).to eq('Recipe 1')
#     expect(@recipe.preparation_time).to eq(8)
#     expect(@recipe.cooking_time).to eq(23)
#     expect(@recipe.description).to eq('Description 01')
#   end
# end