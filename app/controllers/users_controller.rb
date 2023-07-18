class UsersController < ApplicationController
    def new
        
    end
    def create
        user = User.new(user_params)
        if(user.save)
            redirect_to root_path
        end
        
    end

    private
    def user_params
        params.require(:users).permit(:name, :email , :password)

    end

end