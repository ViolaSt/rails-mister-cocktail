class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def create
  @dose = Dose.create(dose_params)
   if @dose.save
    redirect_to cocktail_path(@dose.cocktail)
    else
    @cocktail = @dose.cocktail
    render "cocktails/new"
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

 # redirect after finished processing
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
