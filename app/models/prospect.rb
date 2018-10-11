class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true




  def self.to_csv
    attributes = %w{advisor_first_name advisor_last_name organization street_address address2 city state zip phone website employees revenue vc_already prospect_note intro_presentation_date estimated_ap sm_presentation_date actual_ap sm_conversion_est conversion_percentage status agreement_date sm_received_date sm_status contact1_first_name contact1_last_name contact1_title contact1_phone contact1_mobile contact1_email contact2_first_name contact2_last_name contact2_title contact2_phone contact2_mobile contact2_email primary_contact intro_presenter sm_presenter close_date references_given}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |prospect|
        csv << prospect.attributes.values_at(*attributes)
      end
    end
  end



  
  def self.search(query)
    # Note that PostgreSQL is case specific for like when searching where sqlite3 is not
    where("LOWER(organization) like ?", "%#{query.downcase}%")
    # To search by more than one variable, do the following
    # where("LOWER(organization) like ? OR LOWER(status) like ?", "%#{query.downcase}%", "%#{query.downcase}%")
  end
  
end