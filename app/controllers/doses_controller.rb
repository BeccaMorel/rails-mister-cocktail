class DosesController < ApplicationController
    
    def new
      set_cocktail
      @dose = Dose.new
      @ingredients = Ingredient.all
    end
    def create
        set_cocktail
        @ingredient = Ingredient.find_by_id(params[:dose][:ingredient])
        @dose = Dose.create(description: dose_params, cocktail_id: @cocktail.id, ingredient_id: @ingredient.id)
        @ingredients = Ingredient.all
      if @dose.save
        redirect_to cocktail_path(@cocktail.id)
      else
        render :new
      end
    end

    def destroy
      dose = Dose.find(params[:id])
      dose.destroy
      redirect_to cocktail_path(@cocktail.id)
    end
    private

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
    
    def dose_params
      params.require(:dose).permit(:description)
    end
end
