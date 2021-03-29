class DosesController < ApplicationController
  # create a new dose with description and ingredient
  # to add to an existing cocktail
  def create
    @dose = Dose.new(cocktail_id: params[:cocktail_id], ingredient_id: params[:dose][:ingredient_id],
                     description: params[:dose][:description])
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id]), notice: 'Cocktail was successfully created.'
    else
      @cocktail = Cocktail.find(params[:cocktail_id])
      @doses = @cocktail.doses
      render 'cocktails/show'
    end
  end

  # Destroys a previously created dose from an existing cocktail
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(params[:id])
  end

  # Mandatory parameters required to create a dose
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
