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

      describe "GET new" do
      it "assigns a new dose as @dose" do
        get :new, params: { cocktail_id: @cocktail.id }
        expect(assigns(:cocktail)).to eq(@cocktail)
        expect(assigns(:dose)).to be_a_new(Dose)
      end
    end
end
