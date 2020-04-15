class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true
  validates :user_id, :presence => true
  # validates :intro_presentation_date, :presence => true
  # validates :employees, :numericality => {:only_integer => true}
  # validates :pay_hourly_employees, :numericality => {:only_integer => true}
  delegate :email, to: :user, allow_nil: true, prefix: true

  # def self.to_csv
  #   CSV.generate(headers: true) do |csv|
  #     csv << ["advisor_name", 
  #             "email", 
  #             "advisor_phone", 
  #             "advisor_mobile", 
  #             "organization", 
  #             "street_address", 
  #             "address2", 
  #             "city", 
  #             "state", 
  #             "zip", 
  #             "phone", 
  #             "website", 
  #             "employees,", 
  #             "hcs_notes", 
  #             "created_at,", 
  #             "updated_at,", 
  #             "intro_presentation_date", 
  #             "hcs_sme_fact_finding_call_date", 
  #             "current_health_benefit_cost,", 
  #             "new_estimated_health_benefit_cost,", 
  #             "savings_percentage,", 
  #             "hcs_opportunity_status", 
  #             "agreement_date", 
  #             "user_id", 
  #             "hcs_sme_proposal_meeting_date", 
  #             "contact1_first_name", 
  #             "contact1_last_name", 
  #             "contact1_title", 
  #             "contact1_phone", 
  #             "contact1_mobile", 
  #             "contact1_email", 
  #             "contact2_first_name", 
  #             "contact2_last_name", 
  #             "contact2_title", 
  #             "contact2_phone", 
  #             "contact2_mobile", 
  #             "contact2_email", 
  #             "primary_contact", 
  #             "intro_presenter", 
  #             "hcs_sme", 
  #             "close_date", 
  #             "effective_date", 
  #             "hcbq_business_type", 
  #             "hcbq_no_of_eligible_employees", 
  #             "hcbq_total_participation", 
  #             "hcbq_current_carrier", 
  #             "hcbq_current_coverage_type", 
  #             "hcbq_most_important", 
  #             "hcbq_sustainable", 
  #             "hcbq_oop", 
  #             "hcbq_like_best", 
  #             "hcbq_like_least", 
  #             "hcbq_scale", 
  #             "hcbq_perfect_plan", 
  #             "hcbq_notes", 
  #             "submitted_hcsq,", 
  #             "hcs_next_action", 
  #             "hcs_next_action_date", 
  #             "renewal_month", 
  #             "hcs_prospect,", 
  #             "pay_prospect,", 
  #             "pay_intro_presentation_date", 
  #             "pay_intro_presenter", 
  #             "pay_sme_presentation_date", 
  #             "pay_sme", 
  #             "pay_status", 
  #             "pay_agreement_date", 
  #             "pay_hourly_employees,", 
  #             "pay_next_action_date", 
  #             "pay_next_action", 
  #             "pay_submitted_to_branch,", 
  #             "date_submitted_to_branch", 
  #             "pay_notes", 
  #             "prospect_notes", 
  #             "vcp_prospect,", 
  #             "vcp_intro_presentation_date", 
  #             "vcp_intro_presenter", 
  #             "vcp_sme_presentation_date", 
  #             "vcp_supplier_match_meeting_date", 
  #             "vcp_sme", 
  #             "vcp_status", 
  #             "vcp_agreement_date", 
  #             "vcp_next_action_date", 
  #             "vcp_next_action", 
  #             "vcp_notes"]
  #     all.each do |prospect|
  #       advisor_name = prospect.user.advisor_first_name + " " + prospect.user.advisor_last_name
  #       csv << [prospect.user.advisor_name, 
  #               prospect.user.email, 
  #               prospect.user.advisor_phone, 
  #               prospect.user.advisor_mobile, 
  #               prospect.organization, 
  #               prospect.street_address, 
  #               prospect.address2, 
  #               prospect.city, 
  #               prospect.state, 
  #               prospect.zip, 
  #               prospect.phone, 
  #               prospect.website, 
  #               prospect.employees, 
  #               prospect.hcs_notes, 
  #               prospect.created_at, 
  #               prospect.updated_at, 
  #               prospect.intro_presentation_date, 
  #               prospect.hcs_sme_fact_finding_call_date, 
  #               prospect.current_health_benefit_cost, 
  #               prospect.new_estimated_health_benefit_cost, 
  #               prospect.savings_percentage, 
  #               prospect.status, 
  #               prospect.agreement_date, 
  #               prospect.user_id, 
  #               prospect.hcs_sme_proposal_meeting_date, 
  #               prospect.contact1_first_name, 
  #               prospect.contact1_last_name, 
  #               prospect.contact1_title, 
  #               prospect.contact1_phone, 
  #               prospect.contact1_mobile, 
  #               prospect.contact1_email, 
  #               prospect.contact2_first_name, 
  #               prospect.contact2_last_name, 
  #               prospect.contact2_title, 
  #               prospect.contact2_phone, 
  #               prospect.contact2_mobile, 
  #               prospect.contact2_email, 
  #               prospect.primary_contact, 
  #               prospect.intro_presenter, 
  #               prospect.hcs_sme, 
  #               prospect.close_date, 
  #               prospect.effective_date, 
  #               prospect.hcbq_business_type, 
  #               prospect.hcbq_no_of_eligible_employees, 
  #               prospect.hcbq_total_participation, 
  #               prospect.hcbq_current_carrier, 
  #               prospect.hcbq_current_coverage_type, 
  #               prospect.hcbq_most_important, 
  #               prospect.hcbq_sustainable, 
  #               prospect.hcbq_oop, 
  #               prospect.hcbq_like_best, 
  #               prospect.hcbq_like_least, 
  #               prospect.hcbq_scale, 
  #               prospect.hcbq_perfect_plan, 
  #               prospect.hcbq_notes, 
  #               prospect.submitted_hcsq, 
  #               prospect.hcs_next_action, 
  #               prospect.hcs_next_action_date, 
  #               prospect.renewal_month, 
  #               prospect.hcs_prospect, 
  #               prospect.pay_prospect, 
  #               prospect.pay_intro_presentation_date, 
  #               prospect.pay_intro_presenter, 
  #               prospect.pay_sme_presentation_date, 
  #               prospect.pay_sme, 
  #               prospect.pay_status, 
  #               prospect.pay_agreement_date, 
  #               prospect.pay_hourly_employees, 
  #               prospect.pay_next_action_date, 
  #               prospect.pay_next_action, 
  #               prospect.pay_submitted_to_branch, 
  #               prospect.date_submitted_to_branch, 
  #               prospect.pay_notes, 
  #               prospect.prospect_notes, 
  #               prospect.vcp_prospect, 
  #               prospect.vcp_intro_presentation_date, 
  #               prospect.vcp_intro_presenter, 
  #               prospect.vcp_sme_presentation_date, 
  #               prospect.vcp_supplier_match_meeting_date, 
  #               prospect.vcp_sme, 
  #               prospect.vcp_status, 
  #               prospect.vcp_agreement_date, 
  #               prospect.vcp_next_action_date, 
  #               prospect.vcp_next_action, 
  #               prospect.vcp_notes]
  #     end
  #   end
  # end


  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |prospect|
        csv << prospect.attributes.values_at(*column_names)
      end
    end
  end  


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      prospect_hash = row.to_hash
      prospect = find_or_create_by!(id: prospect_hash['id'])
      prospect.update_attributes(prospect_hash)
    end
  end


  def self.search(query)
    # Note that PostgreSQL is case specific for like when searching where sqlite3 is not
    where("LOWER(organization) like ?", "%#{query.downcase}%")
    # To search by more than one variable, do the following
    # where("LOWER(organization) like ? OR LOWER(status) like ?", "%#{query.downcase}%", "%#{query.downcase}%")
  end
  
end