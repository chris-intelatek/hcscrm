module ProspectsHelper

  # Dashboard


  def shipping_no_sale
    @prospects.where(shipping_opportunity_status: "Closed Lost").count +
    @prospects.where(shipping_opportunity_status: "Closed Not Qualified").count +
    @prospects.where(shipping_opportunity_status: "Lead Declined by ShipStore").count
  end
  
  def hcs_no_sale
    @prospects.where(hcs_opportunity_status: "Intro Pres Given - No Sale").count +
    @prospects.where(hcs_opportunity_status: "Fact Finder Call Done - No Sale").count +
    @prospects.where(hcs_opportunity_status: "Proposal Given - No Sale").count +
    @prospects.where(hcs_opportunity_status: "Not Qualified").count +
    @prospects.where(hcs_opportunity_status: "Other - No Sale").count
  end

  def pay_no_sale
    @prospects.where(pay_status: "Intro Pres Given - No Sale").count +
    @prospects.where(pay_status: "SME Presentation Done - No Sale").count +
    @prospects.where(pay_status: "Not Qualified").count +
    @prospects.where(pay_status: "Other - No Sale").count
  end


end

