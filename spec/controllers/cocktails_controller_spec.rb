require 'rails_helper'
begin
  require 'cocktails_controller'
rescue LoadError
end

if defined?(CocktailsController)
  RSpec.describe CocktailsController, type: :controller do
    let(:valid_attributes) do
      {
        name: 'Moscow Mule',
        photo: photo
      }
    end

    let(:invalid_attributes) do
      { name: '' }
    end

    let(:photo) do
      Rack::Test::UploadedFile.new(
        Rails.root.join('app/assets/images/moscow.jpeg'), 'image/jpg'
      )
    end

    describe 'index action' do
      it 'assigns all cocktails as @cocktails' do
        cocktail = Cocktail.create! valid_attributes
        get :index, params: {}
        expect(assigns(:cocktails)).to eq([cocktail])
      end
    end

    describe 'show action' do
      it 'assigns the requested cocktail as @cocktail' do
        cocktail = Cocktail.create! valid_attributes
        get :show, params: { id: cocktail.to_param }
        expect(assigns(:cocktail)).to eq(cocktail)
      end
    end

    describe 'create action' do
      describe 'with valid params' do
        it 'creates a new Cocktail' do
          expect do
            post :create, params: { cocktail: valid_attributes }
          end.to change(Cocktail, :count).by(1)
        end
      end

      it 'assigns a newly created cocktail as @cocktail' do
        post :create, params: { cocktail: valid_attributes }
        expect(assigns(:cocktail)).to be_a(Cocktail)
        expect(assigns(:cocktail)).to be_persisted
      end
    end
  end
else
  describe 'CocktailsController' do
    it 'should exist' do
      expect(defined?(CocktailsController)).to eq(true)
    end
  end
end
