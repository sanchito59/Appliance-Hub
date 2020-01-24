class SessionsController < ApplicationController
    def create
      @user = User.authenticate(params[:email], params[:password])
      if @user
        session[:user_id] = @user.id
        if current_user.admin === true
          flash[:notice] = "Welcome, Admin"
        else
          flash[:notice] = "You've signed in."
        end
        redirect_to "/"
      else
        flash[:alert] = "There was a problem signing in. Please try again."
        redirect_to signin_path
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:notice] = "You've signed out."
      redirect_to "/"
    end
  end