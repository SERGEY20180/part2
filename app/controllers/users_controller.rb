class UsersController < ApplicationController
  before_action :authenticate_user! 

  def destroy
    @users = User.find(params[:id])

    if @users.destroy
        redirect_to home_user_path, notice: "User deleted."
        #redirect_to root_url, notice: "User deleted."
    end
   end

  def show
    @users = User.all
  end

end
