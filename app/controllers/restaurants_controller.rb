class RestaurantsController < ApplicationController
    # skip_before_action :authorized?

    def index
        # @restaurants = Restaurant.all
        if params[:search].present?
            @restaurant = Restaurant.where('cuisine LIKE ?', params[:search]) 
        else
            @restaurant = Restaurant.all
        end

    end 

    def show 
        @restaurant = Restaurant.find(params[:id])
    end 

    private

    def restaurant_params 
        params.require(:restaurant).permit(:cuisine, :search)
    end 



end
