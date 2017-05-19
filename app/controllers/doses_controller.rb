class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def create
    @ingredient = Ingredient.find_by_id(dose_params[:ingredient_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(description: dose_params[:description],  ingredient: @ingredient, cocktail: @cocktail)
     if @dose.save
      redirect_to cocktail_path(@cocktail)
      else
        @ingredients = Ingredient.all
        render :new
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

 # redirect after finished processing
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
