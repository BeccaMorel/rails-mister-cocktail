class CocktailsController < ApplicationController
    def index
        @cocktails = Cocktail.all
    end

    def show
        @cocktail = Cocktail.find(params[:id])
        @cocktail_doses = Dose.where(params[:cocktail_id])
    end

    def new
        @new_cocktail = Cocktail.new
    end

    def create
        @new_cocktail = Cocktail.create(cocktail_params)
        if @new_cocktail.save
          redirect_to cocktails_path
        else
          render :new
        end
    end
    
    private
    def cocktail_params
        params.require(:cocktail).permit(:name)
    end

end
