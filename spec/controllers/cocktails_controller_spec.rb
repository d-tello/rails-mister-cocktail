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
      before do
        get :index
      end

      it 'returns a succesfull response' do
        expect(response).to have_http_status(200)
      end

      it 'renders the index page' do
        expect(response).to render_template :index
      end

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

      it 'renders the show page' do
        cocktail = Cocktail.create! valid_attributes
        get :show, params: { id: cocktail.to_param }
        expect(response).to render_template :show
      end
    end

    describe 'create action' do
      describe 'with valid params' do
        it 'creates a new Cocktail' do
          expect do
            post :create, params: { cocktail: valid_attributes }
          end.to change(Cocktail, :count).by(1)
        end

        it 'assigns a newly created cocktail as @cocktail' do
          post :create, params: { cocktail: valid_attributes }
          expect(assigns(:cocktail)).to be_a(Cocktail)
          expect(assigns(:cocktail)).to be_persisted
        end

        it 'redirects to the new created cocktail' do
          post :create, params: { cocktail: valid_attributes }
          expect(response).to redirect_to(Cocktail.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved cocktail as @cocktail' do
          post :create, params: { cocktail: invalid_attributes }
          expect(assigns(:cocktail)).to be_a_new(Cocktail)
        end

        it 'renders the page again with error if the params are not valid' do
          post :create, params: { cocktail: invalid_attributes }
          expect(response).to render_template('new')
        end
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
