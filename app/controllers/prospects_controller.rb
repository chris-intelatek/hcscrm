class ProspectsController < ApplicationController
  before_action :find_prospect, only: [:show, :edit, :update, :destroy, :hcsq, :hcsq_update]
  skip_before_action :authenticate_user!, only: [:new_lead, :new_lead_create]
  
  def index
    if params[:status] == nil

      if params[:search]
        @prospects = Prospect.search(params[:search]).order("created_at DESC")
      else
        @prospects = Prospect.all.order('user_id DESC')
      end

    else
      @prospects = Prospect.where(status: params[:status])
    end
    @status = Prospect.select(:status).order(:status).distinct
    
    respond_to do |format|
      format.html
      format.csv { send_data @prospects.to_csv, filename: "Prospects-#{Date.today}.csv" }
    end
  end
  
  def show
  end

  def dashboard
    @prospects = Prospect.all
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
    @prospect = Prospect.new(prospect_params)
    if @prospect.save
      NotificationMailer.new_meeting(@prospect).deliver_later
      flash[:success] = "New prospect added."
      redirect_to root_path
    else
      render 'new_lead'
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
  
  def destroy
    @prospect.destroy
    flash[:danger] = "Prospect has been deleted."
    redirect_to root_path
  end

  private
    def prospect_params
      params.require(:prospect).permit(:user_id, :organization, :street_address, :address2, :city, :state, :zip, :phone, :website, :employees, :prospect_note, :created_at, :updated_at, :intro_presentation_date, :hcs_sme_fact_finding_call_date, :current_health_benefit_cost, :new_estimated_health_benefit_cost, :savings_percentage, :status, :agreement_date, :hcs_sme_proposal_meeting_date, :contact1_first_name, :contact1_last_name, :contact1_title, :contact1_phone, :contact1_mobile, :contact1_email, :contact2_first_name, :contact2_last_name, :contact2_title, :contact2_phone, :contact2_mobile, :contact2_email, :primary_contact, :intro_presenter, :hcs_sme, :close_date, :effective_date, :hcbq_business_type, :hcbq_no_of_eligible_employees, :hcbq_total_participation, :hcbq_current_carrier, :hcbq_current_coverage_type, :hcbq_most_important, :hcbq_sustainable, :hcbq_oop, :hcbq_like_best, :hcbq_like_least, :hcbq_scale, :hcbq_perfect_plan, :hcbq_notes, :intelatek_bda, :intelatek_notes, :intelatek_day, :intelatek_timezone, :hcs_monthly_savings_fee, :hcs_pepm_fee, :intelatek_time, :submitted_hcsq, :next_action, :next_action_date)
    end

    def find_prospect
      @prospect = Prospect.find(params[:id])
    end

end