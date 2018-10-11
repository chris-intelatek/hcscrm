class RegistrationsController < Devise::RegistrationsController
  include CookieManager
  before_action :set_group_cookie, only: :new
  before_action :ensure_group_is_set, only: :new

  private

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:group]
  end

  def sign_up_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :email, :password, :password_confirmation, :group)
  end

  def account_update_params
    params.require(:user).permit(:advisor_first_name, :advisor_last_name, :advisor_phone, :advisor_mobile, :admin, :manager, :email, :password, :password_confirmation, :current_password, :group)
  end
  
  def set_group_cookie
    set_cookie(:group_identifier, params[:group]) if params[:group]
    @group_id = get_cookie(:group_identifier)
  end
  
  def ensure_group_is_set
    unless @group_id
      redirect_to root_path and return 
      flash[:danger] = 'Please contact your administrator.'
    end
  end
  
end