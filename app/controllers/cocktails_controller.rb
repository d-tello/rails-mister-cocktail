class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show edit]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
   end

  # def new
  #   @cocktail = cocktail.new
  # end

  # def edit; end

  # def create
  #   @cocktail = cocktail.new(cocktail_params)

  #   if @cocktail.save
  #     redirect_to cocktails_path, notice: 'Cocktail was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  # def cocktail_params
  #   params.require(:cocktail).permit(:name)
  # end
end
