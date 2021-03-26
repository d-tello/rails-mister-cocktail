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

   describe "with invalid params" do
        it "assigns a newly created but unsaved dose as @dose" do
          post :create, params: { cocktail_id: @cocktail.id, :dose => invalid_attributes}
          expect(assigns(:dose)).to be_a_new(Dose)
        end



  end
end
