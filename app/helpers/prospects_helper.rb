module ProspectsHelper

  # Dashboard
  
  def all_in_crm 
    @prospects.count
  end

  def no_sale
    @prospects.where(status: "Intro Pres Given - No Sale").count +
    @prospects.where(status: "Fact Finder Call Done - No Sale").count +
    @prospects.where(status: "Proposal Given - No Sale").count +
    @prospects.where(status: "Not Qualified").count
  end

end
