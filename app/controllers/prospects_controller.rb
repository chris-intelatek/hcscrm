class ProspectsController < ApplicationController
  before_action :find_prospect, only: [:show, :edit, :update, :destroy, :hcsq, :hcsq_update, :hcs, :hcs_update, :pay, :pay_update, :lead, :lead_update]
  skip_before_action :authenticate_user!, only: [:new_lead, :new_lead_create]
  

  def index
    @status = Prospect.select(:status).order(:status).distinct
    @pay_status = Prospect.select(:pay_status).order(:pay_status).distinct
    if params[:status] != nil
      @prospects = Prospect.where(status: params[:status])
      elsif params[:pay_status] != nil
        @prospects = Prospect.where(pay_status: params[:pay_status])
      elsif params[:search]
        @prospects = Prospect.search(params[:search]).order("created_at DESC")
      elsif
        @prospects = Prospect.all.order('user_id DESC')
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


  def dashboard
    @prospects = Prospect.all
    @users = User.all
  end


  def intelatek
    @prospects = Prospect.all.order("created_at DESC")
    @users = User.all
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
  
  
  def edit
  end
  
  
  def hcsq
  end
  
  
  def hcsq_update
    if @prospect.update(prospect_params)
      NotificationMailer.new_hcsq(@prospect).deliver_later
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'bchq'
    end
  end

  
  def update
    if @prospect.update(prospect_params)
      flash[:success] = "Prospect has been updated."
      redirect_to prospect_path
    else
      render 'edit'
    end
  end


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

  
  def destroy
    @prospect.destroy
    flash[:danger] = "Prospect has been deleted."
    redirect_to root_path
  end


  private
    def prospect_params
      params.require(:prospect).permit(:user_id, :organization, :street_address, :address2, :city, :state, :zip, :phone, :website, :employees, :prospect_notes, :created_at, :updated_at, :intro_presentation_date, :hcs_sme_fact_finding_call_date, :current_health_benefit_cost, :new_estimated_health_benefit_cost, :savings_percentage, :agreement_date, :hcs_sme_proposal_meeting_date, :contact1_first_name, :contact1_last_name, :contact1_title, :contact1_phone, :contact1_mobile, :contact1_email, :contact2_first_name, :contact2_last_name, :contact2_title, :contact2_phone, :contact2_mobile, :contact2_email, :primary_contact, :intro_presenter, :hcs_sme, :close_date, :effective_date, :hcbq_business_type, :hcbq_no_of_eligible_employees, :hcbq_total_participation, :hcbq_current_carrier, :hcbq_current_coverage_type, :hcbq_most_important, :hcbq_sustainable, :hcbq_oop, :hcbq_like_best, :hcbq_like_least, :hcbq_scale, :hcbq_perfect_plan, :hcbq_notes, :intelatek_bda, :intelatek_notes, :intelatek_day, :intelatek_timezone, :hcs_monthly_savings_fee, :hcs_pepm_fee, :intelatek_time, :submitted_hcsq, :hcs_next_action, :hcs_next_action_date, :hcs_prospect, :pay_prospect, :vcp_prospect, :pay_intro_presentation_date, :pay_intro_presenter, :pay_sme_presentation_date, :pay_sme, :pay_agreement_date, :pay_hourly_employees, :pay_next_action_date, :pay_next_action, :pay_submitted_to_branch, :status, :pay_status, :renewal_month, :hcs_notes, :pay_notes, :date_submitted_to_branch, :date_submitted_to_branch, :intelatek_lead_type, :vcp_intro_presentation_date, :vcp_intro_presenter, :vcp_sme_presentation_date, :vcp_supplier_match_meeting_date, :vcp_sme, :vcp_status, :vcp_agreement_date, :vcp_next_action_date, :vcp_next_action)
    end


    def find_prospect
      @prospect = Prospect.find(params[:id])
    end

end