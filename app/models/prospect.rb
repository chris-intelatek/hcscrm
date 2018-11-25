class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true
  validates :intro_presentation_date, :presence => true
  validates :employees, :numericality => {:only_integer => true, :greater_than => 0}
  delegate :email, to: :user, allow_nil: true, prefix: true


  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << ["Advisor Name", "Advisor Email", "Advisor Phone", "Advisor Mobile",
      "Organization", "Update", "Intro Pres Date", "SME Call Date", "Status"]
      all.each do |prospect|
        
        #<!-- I wrote this very clunky section that I need to rework at some point in the future... Chris
      	if prospect.next_action_date.nil? || prospect.next_action_date < Date.yesterday
          update1 = "yes"
      	end
        if prospect.intro_presentation_date.nil? || prospect.intro_presentation_date < Date.yesterday
          update2 = "yes"
        end
        if prospect.hcs_sme_fact_finding_call_date.nil? || prospect.hcs_sme_fact_finding_call_date < Date.yesterday
          update3 = "yes"
        end
      	if prospect.hcs_sme_proposal_meeting_date.nil? || prospect.hcs_sme_proposal_meeting_date < Date.yesterday
          update4 = "yes"
      	end
      	if prospect.effective_date.nil? || prospect.effective_date < Date.yesterday
          update5 = "yes"
      	end
    	  if (prospect.status != "Other - No Sale") && 
    	        (prospect.status != "Closed - Group is Effective") && 
    	        (prospect.status !=  "Intro Pres Given - No Sale") && 
    	        (prospect.status != "Fact Finder Call Done - No Sale") && 
    	        (prospect.status != "Proposal Given - No Sale") && 
    	        (prospect.status != "Not Qualified - No Sale")
          if update1 && update2 && update3 && update4 && update5 == "yes"
        	  update = "Needs Updating"
        	  else
        	    update = "ok"
          end
    	  end
    		#<!--End of clunky section.-->
        
        advisor_name = prospect.user.advisor_first_name + " " + prospect.user.advisor_last_name
        csv << [advisor_name, prospect.user.email, prospect.user.advisor_phone,
              prospect.user.advisor_mobile, prospect.organization, update, prospect.intro_presentation_date,
              prospect.hcs_sme_fact_finding_call_date, prospect.status]
      end
    end
  end


  # def self.to_csv
  #   CSV.generate(headers: true) do |csv|
  #     csv << column_names
  #     all.each do |prospect|
  #       csv << prospect.attributes.values_at(*column_names)
  #     end
  #   end
  # end

  
  def self.search(query)
    # Note that PostgreSQL is case specific for like when searching where sqlite3 is not
    where("LOWER(organization) like ?", "%#{query.downcase}%")
    # To search by more than one variable, do the following
    # where("LOWER(organization) like ? OR LOWER(status) like ?", "%#{query.downcase}%", "%#{query.downcase}%")
  end
  
end