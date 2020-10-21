class SessionsController < ApplicationController
    skip_before_action :authorized?, only: [:new_login, :login]
  
    def logout 
      session.delete(:user_id)
      redirect_back fallback_location: restaurants_path
    end 
  
    def new_login
    end 
  
    def login 
      @user = User.find_by(name: params[:session][:name])
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id 
          redirect_to user_path(@user)
        else 
          flash[:error] = "Password or Email did not match"
          redirect_to new_login_path
        end 
    end 
  
  end