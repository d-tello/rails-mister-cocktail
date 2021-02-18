class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params[:cocktail_id]
    @dose.ingredient_id = params[:dose][:ingredient_id]

    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id]), notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
