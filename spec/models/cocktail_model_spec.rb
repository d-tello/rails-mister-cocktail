require 'rails_helper'

RSpec.describe 'Cocktail', type: :model do
  let(:valid_attributes) do
    {
      name: 'Moscow Mule'
    }
  end

  let(:photo) do
    Rack::Test::UploadedFile.new(
      Rails.root.join('app/assets/images/moscow.jpeg'), 'image/jpg'
    )
  end

  it 'has a name' do
    cocktail = Cocktail.new(name: 'Moscow Mule')
    expect(cocktail.name).to eq('Moscow Mule')
  end

  it 'name cannot be blank' do
    attributes = valid_attributes
    attributes.delete(:name)
    cocktail = Cocktail.new(attributes)
    expect(cocktail).not_to be_valid
  end

  it 'name is unique' do
    Cocktail.create!(name: 'Moscow Mule', photo: photo)
    cocktail = Cocktail.new(name: 'Moscow Mule', photo: photo)
    expect(cocktail).not_to be_valid
  end

  it 'has many doses' do
    cocktail = Cocktail.new(valid_attributes)
    expect(cocktail).to respond_to(:doses)
    expect(cocktail.doses.count).to eq(0)
  end

  it 'should destroy child doses when destroying self' do
    cocktail = Cocktail.create!(valid_attributes)
    ingredient = Ingredient.create!(name: 'Vodka')
    cocktail.doses.create(ingredient: ingredient, description: '50 ml')
    expect { cocktail.destroy }.to change { Dose.count }.from(1).to(0)
  end

  it 'has many ingredients' do
    cocktail = Cocktail.create!(valid_attributes)
    expect(cocktail).to respond_to(:ingredients)
    expect(cocktail.ingredients.count).to eq(0)

    ingredient = Ingredient.create!(name: 'Vodka')
    cocktail.doses.create(ingredient: ingredient, description: '50 ml')
    expect(cocktail.ingredients.count).to eq(1)
  end
end
