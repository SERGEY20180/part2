class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def about
  end
  def user
    @users = User.all
  end
  def destroy
   @users = User.find(params[:id])

   if @users.destroy
      redirect_to root_url, notice: "User deleted."
   end
end
end
