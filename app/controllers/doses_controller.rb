class DosesController < ApplicationController

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

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
