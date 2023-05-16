class SessionsController < ApplicationController
   before_action :log_in_redirect , only: [:new, :create]
    def new
    end


    def create
        user = User.find_by(name: params[:session][:name].downcase)
 
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            flash[:success] = "Logged is successfully"
            redirect_to root_path
        else
            flash.now[:error] = "There was something wrong"
             render 'new'  

        end 

    end



    def destroy

        session[:user_id] = nil
        flash[:success] = "you have successfully Log out"
        redirect_to login_path  
    end



    private 
   def log_in_redirect
    if loggedin?
        flash[:error] = "you are already logged in"
        redirect_to root_path
    end
   end


end