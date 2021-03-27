require 'rails_helper'
begin
  require 'doses_controller'
rescue LoadError
end

if defined?(DosesController)
  RSpec.describe DosesController, type: :controller do
    before(:each) do
      @cocktail = Cocktail.create!(name: 'Moscow Mule')
      @ingredient = Ingredient.create!(name: 'Vodka')
    end

    let(:valid_attributes) do
      {
        description: '50 ml',
        cocktail_id: @cocktail.id,
        ingredient_id: @ingredient.id
      }
    end

    let(:invalid_attributes) do
      { description: '' }
    end

    describe 'create action' do
      describe 'with valid params' do
        it 'creates a new Dose' do
          expect do
            post :create, params: { cocktail_id: @cocktail.id, dose: valid_attributes }
          end.to change(Dose, :count).by(1)
        end
      end

      it 'assigns a newly created dose as @dose' do
        post :create, params: { cocktail_id: @cocktail.id, dose: valid_attributes }
        expect(assigns(:dose)).to be_a(Dose)
        expect(assigns(:dose)).to be_persisted
      end
    end
  end
else
  describe 'DosesController' do
    it 'should exist' do
      expect(defined?(DosesController)).to eq(true)
    end
  end
end
