module ProspectsHelper

  # Dashboard
  
  def all_in_crm 
    @prospects.count
  end

  def hcs_prospects_in_crm
		@prospects.where(hcs_prospect: true).count +
		@prospects.where.not(status: nil).count
  end

  def hcs_no_sale
    @prospects.where(status: "Intro Pres Given - No Sale").count +
    @prospects.where(status: "Fact Finder Call Done - No Sale").count +
    @prospects.where(status: "Proposal Given - No Sale").count +
    @prospects.where(status: "Not Qualified").count +
    @prospects.where(status: "Other - No Sale").count
  end

  def pay_no_sale
    @prospects.where(status: "Intro Pres Given - No Sale").count +
    @prospects.where(status: "SME Presentation Done - No Sale").count +
    @prospects.where(status: "Not Qualified").count +
    @prospects.where(status: "Other - No Sale").count
  end

end
