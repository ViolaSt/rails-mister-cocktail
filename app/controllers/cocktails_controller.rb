class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  # POST
  # redirect after finished processing
 def create
  @cocktail = Cocktail.create(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
        format.json { render :show, status: :created, location: @cocktail }
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET
  def new
    @cocktail = Cocktail.new
  end

  # GET
  def edit
  end

  # GET
  def show
  end

  # redirect after finished processing
  def update
    @cocktail.update(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end
 # redirect after finished processing
  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
