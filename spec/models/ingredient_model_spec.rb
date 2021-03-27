require 'rails_helper'

RSpec.describe 'Ingredient', type: :model do
  let(:valid_attributes) do
    {
      name: 'Vodka'
    }
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
end
