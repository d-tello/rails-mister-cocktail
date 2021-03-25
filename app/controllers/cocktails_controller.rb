class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show edit]
  # List all existing cocktails
  def index
    @cocktails = Cocktail.all
  end

  # Show a specific cocktail with its doses
  def show
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  # For the display of the form for creating a new cocktail
  def new
    @cocktail = Cocktail.new
  end

  # Creates a new cocktail with the data entered by the user and saves it in the database
  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
  # Mandatory parameters required to create a cocktail

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
