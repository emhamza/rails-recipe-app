require 'rails_helper'
require 'faker'

RSpec.describe Recipe, type: :model do
  naledi = User.create!(name: Faker::Name.unique.name,
                        email: Faker::Internet.email,
                        password: '1234567', password_confirmation: '1234567')

  subject do
    Recipe.new(name: 'Chicken',
               preparation_time: '1 hr',
               cooking_time: '2 hr',
               description: 'Yummy Food',
               public: false,
               user: naledi) # Set the user_id explicitly
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
