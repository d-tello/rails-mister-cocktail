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

    describe 'show the index page' do
      it 'assigns all cocktails as @cocktails' do
        cocktail = Cocktail.create! valid_attributes
        get :index, params: {}
        expect(assigns(:cocktails)).to eq([cocktail])
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
