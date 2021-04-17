class SessionsController < ApplicationController
    def omniauth
        @user = User.find_with_omniauth(auth)
        if @user
            session[:user_id] = @user.id
            redirect_to user_path
        else
            flash[:errors] = "Please log in"
            redirect_to login_path
        end
      end
    
    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Invalid Username/Password combination"
            redirect_to login_path
        end
    end


    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def google
        @user = User.find_or_create_by(username: auth['info']['name']) do |user|
            user.password = SecureRandom.hex(10)
        end
        if @user && @user.id
            session[:user_id] = @user.id
            redirect_to new_review_path(@user.id)
        else
            redirect_to "/login"
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end


end