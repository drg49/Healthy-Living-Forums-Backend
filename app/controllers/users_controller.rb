class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # REGISTER
    def create
    @user = User.find_by(username: params[:username]) #Check if the user is already in the database
    if @user 
        render json: {error: "User already exists"} #If the user is found in the database, then we cannot create an account under that username
    else 
      @user = User.create(user_params)
      if @user.valid?
        render json: {user: @user}
      else
        render json: {error: "Invalid username or password"}
      end
    end

    end
  
    # LOGGING IN
    def login
      @user = User.find_by(username: params[:username])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {token: token, user: @user.username}
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
    def auto_login
      render json: @user
    end
  
    private

    def user_params
      params.permit(:username, :password)
    end
end
