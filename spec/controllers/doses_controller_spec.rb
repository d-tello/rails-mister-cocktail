require 'rails_helper'
begin
  require 'doses_controller'
rescue LoadError
end

if defined?(DosesController)
  RSpec.describe DosesController, type: :controller do
    before(:each) do
      @cocktail = Cocktail.create!(name: 'Mojito')
      @ingredient = Ingredient.create!(name: 'Lemon')
    end

    let(:valid_attributes) do
      {
        description: '6cl',
        cocktail_id: @cocktail.id,
        ingredient_id: @ingredient.id
      }
    end

    let(:invalid_attributes) do
      { description: '' }
    end
  end
else
  describe 'DosesController' do
    it 'should exist' do
      expect(defined?(DosesController)).to eq(true)
    end
  end
end
