require 'rails_helper'
begin
  require 'doses_controller'
rescue LoadError
end

if defined?(DosesController)
  RSpec.describe DosesController, type: :controller do
    before(:each) do
      @cocktail = Cocktail.create!(name: 'Moscow Mule', photo: photo)
      @ingredient = Ingredient.create!(name: 'Vodka')
    end

    let(:valid_attributes) do
      {
        description: '50 ml',
        cocktail_id: @cocktail.id,
        ingredient_id: @ingredient.id
      }
    end

    let(:photo) do
      Rack::Test::UploadedFile.new(
        Rails.root.join('app/assets/images/moscow.jpeg'), 'image/jpg'
      )
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

        it 'assigns a newly created dose as @dose' do
          post :create, params: { cocktail_id: @cocktail.id, dose: valid_attributes }
          expect(assigns(:dose)).to be_a(Dose)
          expect(assigns(:dose)).to be_persisted
        end

        it 'redirects after successfully created new dose' do
          post :create, params: { cocktail_id: @cocktail.id, dose: valid_attributes }
          expect(response).to redirect_to(@cocktail)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved dose as @dose (with change matcher)' do
          post :create, params: { cocktail_id: @cocktail.id, dose: invalid_attributes }
          expect(assigns(:dose)).not_to(change { Dose.count })
        end

        it 'assigns a newly created but unsaved dose as @dose' do
          post :create, params: { cocktail_id: @cocktail.id, dose: invalid_attributes }
          expect(assigns(:dose)).to be_a_new(Dose)
        end

        it 'renders the page again with error if the params are not valid' do
          post :create, params: { cocktail_id: @cocktail.id, dose: invalid_attributes }
          expect(response).to render_template('cocktails/show')
        end
      end
    end
    describe 'destroy action' do
      it 'deletes a Dose' do
        @dose = Dose.create!(valid_attributes)
        expect do
          delete :destroy, params: { id: @dose.id }
        end.to change(Dose, :count).by(-1)
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
