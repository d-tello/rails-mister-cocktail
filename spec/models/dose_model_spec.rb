require 'rails_helper'

RSpec.describe 'Dose', type: :model do
  let(:moscow_mule) do
    Cocktail.create!(name: 'Moscow Mule', photo: photo)
  end

  let(:vodka) do
    Ingredient.create!(name: 'Vodka')
  end

  let(:ginger_beer) do
    Ingredient.create!(name: 'Ginger beer')
  end

  let(:photo) do
    Rack::Test::UploadedFile.new(
      Rails.root.join('app/assets/images/moscow.jpeg'), 'image/jpg'
    )
  end

  let(:valid_attributes) do
    {
      description: '50 ml',
      cocktail: moscow_mule,
      ingredient: vodka
    }
  end

  it 'has a description' do
    dose = Dose.new(description: '50 ml')
    expect(dose.description).to eq('50 ml')
  end

  it 'description cannot be blank' do
    dose = Dose.new(description: '', ingredient: vodka, cocktail: moscow_mule)
    expect(dose).not_to be_valid
  end
end
