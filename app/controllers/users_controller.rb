class UsersController < ApplicationController
    before_action :find_users, only: [:show, :edit, :destroy, :covid_positive]
    skip_before_action :authorized?, only: [:new, :create]
    

    def index 
        @users = User.all
    end 

    def show 
        # @user = User.find(params[:id])
        if @current_user != @user 
            flash[:wrong_user] = "You can only see your own profile"
            redirect_to users_path
          end 

          if @current_user.covid_status == true 
            @current_user.reservations.destroy_all
            flash[:warning] = "Thank you for notifying us. We've cancelled all your upcoming reservations. Please rebook when you're better!"
    
          end 

    end 

    def new 
        @user = User.new 
    end 

    def create
        @user = User.create(user_params)
            if @user.valid?
                flash[:success] = "New User Created"
                redirect_to user_path(@user)
            else
                flash[:my_errors] = @user.errors.full_messages
                redirect_to new_user_path
            end 
    end 

    def edit 
        # @user = User.find(params[:id])
    end 

    def update 
        if @current_user.update(user_params)
            redirect_to user_path(@current_user)
        else 
            flash[:my_errors] = @current_user.errors.full_messages
            redirect_to edit_user_path(@current_user)
        end 
    end 

    def destroy
        # @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end 

    def covid_positive
        # @user = User.find(params[:id])
        @user.covid_status = true
        @user.save
        redirect_to user_path(@user)
      end

    private
    
    def find_users
        @user = User.find(params[:id])
    end 

    def user_params 
        params.require(:user).permit(:name, :password, :address, :phone, :covid_status)
    end 

end
