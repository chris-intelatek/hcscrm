class ProspectsController < ApplicationController
  before_action :find_prospect, only: [:show, :edit, :update, :destroy, :bchq, :bchq_update
  ]
  skip_before_action :authenticate_user!, only: [:new_lead, :new_lead_create]
  
  def index
    if params[:status] == nil

      if params[:search]
        @prospects = Prospect.search(params[:search]).order("created_at DESC")
      else
        @prospects = Prospect.all.order('user_id DESC')
        
        # respond_to do |format|
        #   format.html
        #   format.csv { send_data @prospects.to_csv, filename: "Prospects-#{Date.today}.csv" }
        # end
        
      end

    else
      @prospects = Prospect.where(status: params[:status])
    end
    @status = Prospect.select(:status).order(:status).distinct
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
  
  def new_lead
    @prospect = Prospect.new
  end
  
  def new_lead_create
    @prospect = Prospect.new(prospect_params)
    if @prospect.save
      
      flash[:success] = "New prospect added."
      redirect_to prospects_path
    else
      render 'new_lead'
    end
  end
  

  def edit
  end
  
  def bchq
  end
  
  def bchq_update
    if @prospect.update(prospect_params)
      BchqMailer.new_bchq(@prospect).deliver_later
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
      params.require(:prospect).permit(:organization, :street_address, :address2, :city, :state, :zip, :phone, :website, :employees, :prospect_note, :intro_presentation_date, :hcs_sme_fact_finding_call_date, :current_health_benefit_cost, :new_estimated_health_benefit_cost, :savings_percentage, :status, :agreement_date, :effective_date, :hcs_sme_proposal_meeting_date, :contact1_first_name, :contact1_last_name, :contact1_title, :contact1_phone, :contact1_mobile, :contact1_email, :contact2_first_name, :contact2_last_name, :contact2_title, :contact2_phone, :contact2_mobile, :contact2_email, :primary_contact, :intro_presenter, :hcs_sme, :close_date, :hcbq_business_type, :hcbq_no_of_eligible_employees, :hcbq_total_participation, :hcbq_current_carrier, :hcbq_current_coverage_type, :hcbq_most_important, :hcbq_sustainable, :hcbq_oop, :hcbq_like_best, :hcbq_like_least, :hcbq_scale, :hcbq_perfect_plan, :hcbq_notes, :intelatek_bda, :intelatek_notes, :intelatek_day, :intelatek_timezone, :user_id)
    end

    def find_prospect
      @prospect = Prospect.find(params[:id])
    end

end