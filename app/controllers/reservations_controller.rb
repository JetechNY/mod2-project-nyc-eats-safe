class ReservationsController < ApplicationController
    before_action :find_reservations, only: [:edit, :update, :show, :destroy]

    def show 

    end 

    
    def new 
        @reservation = Reservation.new 
    end 

    def create 
        # @reservation = Reservation.create(reservation_params)
        reservation = Reservation.create(reservation_params)
        @current_user.reservations << reservation 
        if reservation.valid?
            redirect_to user_path(@current_user)
        else 
            #   flash[:my_errors] = Reservation.last.errors.full_messages
            flash[:my_errors] = reservation.errors.full_messages
            redirect_to new_reservation_path
        end 
    end 

    def edit 
    end 

    def update 
        if @reservation.update(reservation_params)
            redirect_to user_path(@current_user)
        else 
            flash[:my_errors] = @reservation.errors.full_messages
            redirect_to edit_reservation_path(@reservation)
        end 
    end 

    def destroy  
        @reservation.destroy
        redirect_to user_path(@current_user)
    end

    private
    
    def find_reservations
        @reservation = Reservation.find(params[:id])
    end 

    def reservation_params 
        params.require(:reservation).permit(:user_id, :restaurant_id, :date, :time, :party_size)
    end 

end
