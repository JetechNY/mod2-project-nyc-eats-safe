class RestaurantsController < ApplicationController
    # skip_before_action :authorized?

    def index
        # @restaurants = Restaurant.all
        if params[:search].present?
            @restaurant = Restaurant.where('cuisine LIKE ?', params[:search]).paginate(page: params[:page], per_page: 5)
        else
            @restaurant = Restaurant.paginate(page: params[:page], per_page: 15)
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
