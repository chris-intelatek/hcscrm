class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :import, :new]
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    # if params[:search]
    #   @users = User.search(params[:search]).order("created_at DESC").paginate(:per_page => 5, :page => params[:page])
    # else
    #   @users = User.all.paginate(:per_page => 5, :page => params[:page])
    @state = User.select(:state).order(:state).distinct
    if params[:state] != nil
      @users = User.where(state: params[:state]).paginate(:per_page => 10, :page => params[:page])
    elsif params[:search]
      @users = User.search(params[:search]).order("created_at DESC").paginate(:per_page => 10, :page => params[:page])
    else
      @users = User.all.paginate(:per_page => 10, :page => params[:page])
      # respond_to do |format|
      #   format.html
      #   format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
      # end
    end
  end

  def export_users
      @users = User.all
      respond_to do |format|
        format.html
        format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
      end
  end

  def import
    User.import(params[:file])
    redirect_to root_url, notice: "Users imported."
  end



  def new
    @user = User.new
  end


  def create
    attrs = user_params
    @user = User.new(attrs)
    if @user.save
      flash[:success] = "New User Added."
      redirect_to users_path
    else
      render 'new'
    end
  end


  def show
  end

  # def start_page
  #   if current_user.manager
  #     @users = User.all
  #     @prospects = Prospect.all
  #     render(:template => 'prospects/dashboard')
  #   else
  #     render(:template => 'pages/home')
  #   end
  # end

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
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :advisor_home_phone, :admin, :manager, :support, :staff, :email, :password, :password_confirmation, :group, :entrust, :branch, :mailing_address, :apt_suite, :city, :state, :zip, :advisor_company_name, :intelatek, :attachment1, :attachment2, :attachment3, :attachment4, :attachment5, :attachment6, :attachment7, :attachment8, :attachment9, :attachment10, :attachment1_name, :attachment2_name, :attachment3_name, :attachment4_name, :attachment5_name, :attachment6_name, :attachment7_name, :attachment8_name, :attachment9_name, :attachment10_name, :training_date, :business_plan_date, :signup_date, :fee, :occupation, :broker, :fee_payment_method, :shipstore)
  end
end
