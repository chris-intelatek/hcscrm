module ProspectsHelper

  # Dashboard
  
  def hcs_no_sale
    @prospects.where(status: "Intro Pres Given - No Sale").count +
    @prospects.where(status: "Fact Finder Call Done - No Sale").count +
    @prospects.where(status: "Proposal Given - No Sale").count +
    @prospects.where(status: "Not Qualified").count +
    @prospects.where(status: "Other - No Sale").count
  end

  def pay_no_sale
    @prospects.where(pay_status: "Intro Pres Given - No Sale").count +
    @prospects.where(pay_status: "SME Presentation Done - No Sale").count +
    @prospects.where(pay_status: "Not Qualified").count +
    @prospects.where(pay_status: "Other - No Sale").count
  end

end

