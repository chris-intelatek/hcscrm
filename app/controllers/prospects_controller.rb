class ProspectsController < ApplicationController
  before_action :find_prospect, only: [:show, :edit, :update, :destroy, :hcsq, :hcsq_update, :hcs, :hcs_update, :pay, :pay_update, :vcp, :vcp_update, :lead, :lead_update, :shipping_profile, :shipping_profile_update, :shipping, :shipping_update, :shipping_lead_status, :shipping_lead_status_update, :hcs_lead_status, :hcs_lead_status_update]
  skip_before_action :authenticate_user!, only: [:new_lead, :new_lead_create]
  

  def index
    @shipping_opportunity_status = Prospect.select(:shipping_opportunity_status).order(:shipping_opportunity_status).distinct
    @hcs_opportunity_status = Prospect.select(:hcs_opportunity_status).order(:hcs_opportunity_status).distinct
    @pay_status = Prospect.select(:pay_status).order(:pay_status).distinct
    @vcp_status = Prospect.select(:vcp_status).order(:vcp_status).distinct    
    if params[:shipping_opportunity_status] != nil
      @prospects = Prospect.where(shipping_opportunity_status: params[:shipping_opportunity_status])
    elsif params[:hcs_opportunity_status] != nil
      @prospects = Prospect.where(hcs_opportunity_status: params[:hcs_opportunity_status])
    elsif params[:pay_status] != nil
      @prospects = Prospect.where(pay_status: params[:pay_status])
    elsif params[:vcp_status] != nil
      @prospects = Prospect.where(vcp_status: params[:vcp_status])
    elsif params[:search]
      @prospects = Prospect.search(params[:search]).order("created_at DESC")
    elsif
      @prospects = Prospect.all
    end

    respond_to do |format|
      format.html
      format.csv { send_data @prospects.to_csv, filename: "Prospects-#{Date.today}.csv" }
    end
  end


  def import
    Prospect.import(params[:file])
    redirect_to root_url, notice: "Prospects imported."
  end


  def show
  end


  def new
    @prospect = current_user.prospects.build
  end

  
  def create
    @prospect = current_user.prospects.build(prospect_params)
    if @prospect.save
      flash[:success] = "New prospect added."
      redirect_to prospects_path
    else
      render 'new'
    end
  end


  def edit
  end
  
  
  def update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'edit'
    end
  end

  
  def destroy
    @prospect.destroy
    flash[:danger] = "Prospect has been deleted."
    redirect_to root_path
  end


  def dashboard
    @prospects = Prospect.all
    @users = User.all
  end


# Controllers for IntelaTek appointment setting.

  def intelatek
    @prospects = Prospect.all.order("created_at DESC")
    @users = User.all
  end


  def new_lead
    @prospect = Prospect.new
  end

  
  def new_lead_create
    attrs = prospect_params
    if prospect_params[:pay_prospect] == '1'
      attrs.merge!(pay_status: 'Intro Presentation Scheduled')
    elsif prospect_params[:vcp_prospect] == '1'
      attrs.merge!(vcp_status: 'Intro Presentation Scheduled')
    elsif prospect_params[:hcs_prospect] == '1'
      attrs.merge!(status: 'Intro Presentation Scheduled')
    end

    @prospect = Prospect.new(attrs)
    if @prospect.save
      NotificationMailer.new_meeting(@prospect).deliver_later
      flash[:success] = "New prospect added."
      redirect_to 'http://intelatek.com/intranet/submitted.html'
        if prospect_params[:hcs_prospect] == '1' && prospect_params[:contact1_email].present?
          NotificationMailer.new_hcs_meeting(@prospect).deliver_later
        # elsif  prospect_params[:pay_prospect] == '1' && prospect_params[:contact1_email].present?
        #   NotificationMailer.new_hcs_meeting(@prospect).deliver_later
        elsif  prospect_params[:vcp_prospect] == '1' && prospect_params[:contact1_email].present?
          NotificationMailer.new_vcp_meeting(@prospect).deliver_later
        elsif  prospect_params[:pay_prospect] == '1' && prospect_params[:contact1_email].present?
          NotificationMailer.new_pay_meeting(@prospect).deliver_later 
        end
    else
      render 'new_lead'
    end
  end


  def lead
  end


  def lead_update
    if @prospect.update(prospect_params)
      flash[:success] = "Lead has been updated."
      redirect_to intelatek_path
    else
      render 'lead_path'
    end
  end
  
  

# Controllers for healthcare program

  def hcs
  end

  
  def hcs_update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'hcs'
    end
  end  
  
  
  def hcsq
  end
  
  
  def hcsq_update
    if @prospect.update(prospect_params)
      NotificationMailer.new_hcsq(@prospect).deliver_later
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'hcsq'
    end
  end


  def entrust
    @prospects = Prospect.where(hcs_prospect: true).order("created_at DESC")    
    @users = User.all
  end


  def hcs_lead_status
  end

  def hcs_lead_status_update
    if @prospect.update(prospect_params)
      flash[:success] = "Lead has been updated."
      redirect_to entrust_path
    else
      render 'hcs_lead_status_path'
    end
  end



# Controllers for Shipping Program

  def shipping_profile
  end
  
  
  def shipping_profile_update
    if @prospect.update(prospect_params)
      NotificationMailer.new_shipping_profile(@prospect).deliver_later
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'shipping_show'
    end
  end


  def shipping
  end

  
  def shipping_update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'shipping'
    end
  end


  def shipstore
    @prospects = Prospect.where(shipping_prospect: true).order("created_at DESC")    
    @users = User.all
  end


  def shipping_lead_status
  end


  def shipping_lead_status_update
    if @prospect.update(prospect_params)
      NotificationMailer.shipping_lead_status_update(@prospect).deliver_later      
      flash[:success] = "Lead has been updated."
      redirect_to shipstore_path
    else
      render 'shipping_lead_status_path'
    end
  end



# Controllers for Instant Pay Program

  def branch
    @prospects = Prospect.where(pay_prospect: true).order("created_at DESC")    
    @users = User.all
  end
  
  
  def pay
  end

  
  def pay_update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'pay'
    end
  end  



# Controllers for Virtual Card Program

  def vcp
  end


  def vcp_update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'vcp'
    end
  end  



  private
    def prospect_params
      params.require(:prospect).permit(:user_id, :organization, :street_address, :address2, :city, :state, :zip, :phone, :website, :employees, :prospect_notes, :created_at, :updated_at, :intro_presentation_date, :hcs_sme_fact_finding_call_date, :current_health_benefit_cost, :new_estimated_health_benefit_cost, :savings_percentage, :agreement_date, :hcs_sme_proposal_meeting_date, :contact1_first_name, :contact1_last_name, :contact1_title, :contact1_phone, :contact1_mobile, :contact1_email, :contact2_first_name, :contact2_last_name, :contact2_title, :contact2_phone, :contact2_mobile, :contact2_email, :primary_contact, :intro_presenter, :hcs_sme, :close_date, :effective_date, :hcbq_business_type, :hcbq_no_of_eligible_employees, :hcbq_total_participation, :hcbq_current_carrier, :hcbq_current_coverage_type, :hcbq_most_important, :hcbq_sustainable, :hcbq_oop, :hcbq_like_best, :hcbq_like_least, :hcbq_scale, :hcbq_perfect_plan, :hcbq_notes, :intelatek_bda, :intelatek_notes, :intelatek_day, :intelatek_timezone, :hcs_monthly_savings_fee, :hcs_pepm_fee, :intelatek_time, :submitted_hcsq, :hcs_next_action, :hcs_next_action_date, :hcs_prospect, :pay_prospect, :vcp_prospect, :pay_intro_presentation_date, :pay_intro_presenter, :pay_sme_presentation_date, :pay_sme, :pay_agreement_date, :pay_hourly_employees, :pay_next_action_date, :pay_next_action, :pay_submitted_to_branch, :hcs_opportunity_status, :pay_status, :renewal_month, :hcs_notes, :pay_notes, :date_submitted_to_branch, :date_submitted_to_branch, :intelatek_lead_type, :vcp_intro_presentation_date, :vcp_intro_presenter, :vcp_sme_presentation_date, :vcp_supplier_match_meeting_date, :vcp_sme, :vcp_status, :vcp_agreement_date, :vcp_next_action_date, :vcp_next_action, :vcp_notes, :shipping_prospect, :annual_revenue, :shipping_contact_first_name, :shipping_contact_last_name, :shipping_contact_title, :shipping_contact_direct_phone, :shipping_contact_mobile, :shipping_contact_email, :shipping_type, :shipping_annual_parcel_spend, :shipping_carrier_provided_system, :shipping_interest_in_rate_analysis, :shipping_parcels_per_day, :shipping_integration, :shipping_notes, :shipping_opportunity_status, :shipping_lead_status, :shipping_next_action, :shipping_next_action_date, :hcs_lead_status, :shipping_parcel_carrier, :shipping_ltl_per_week, :shipping_annual_ltl_spend, :shipping_tl_per_week, :shipping_annual_tl_spend)
    end


    def find_prospect
      @prospect = Prospect.find(params[:id])
    end

end