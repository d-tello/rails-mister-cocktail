require 'rails_helper'

RSpec.describe 'Ingredient', type: :model do
  let(:valid_attributes) do
    {
      name: 'Vodka'
    }
  end

  let(:photo) do
    Rack::Test::UploadedFile.new(
      Rails.root.join('app/assets/images/moscow.jpeg'), 'image/jpg'
    )
  end

  it 'has a name' do
    ingredient = Ingredient.new(name: 'Vodka')
    expect(ingredient.name).to eq('Vodka')
  end

  it 'name cannot be blank' do
    attributes = valid_attributes
    attributes.delete(:name)
    ingredient = Ingredient.new(attributes)
    expect(ingredient).not_to be_valid
  end

  it 'name is unique' do
    Ingredient.create!(name: 'Vodka')
    ingredient = Ingredient.new(name: 'Vodka')
    expect(ingredient).not_to be_valid
  end

  it 'has many doses' do
    ingredient = Ingredient.new(valid_attributes)
    expect(ingredient).to respond_to(:doses)
    expect(ingredient.doses.count).to eq(0)
  end

  it 'should not be able to destroy self if has dose children' do
    cocktail = Cocktail.create!(name: 'Moscow Mule', photo: photo)
    ingredient = Ingredient.create!(name: 'Vodka')
    cocktail.doses.create(ingredient: ingredient, description: '50 ml')
    expect { ingredient.destroy }.to raise_error(ActiveRecord::InvalidForeignKey)
  end
end
