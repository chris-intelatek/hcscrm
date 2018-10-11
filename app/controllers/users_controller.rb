class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_action :set_user, only: [:show, :edit, :destroy, :update]


  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all
      
      respond_to do |format|
        format.html
        format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
      end   
      
    end
  end

  def show
  end

  def edit
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  def update
	  if @user.update_attributes(user_params)
		  redirect_to users_path
	  else
	  	render 'edit'
	  end
  end
  
  private
  
  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :support, :email, :password, :password_confirmation, :group)
  end
  
end