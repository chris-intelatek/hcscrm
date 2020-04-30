class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_many :attachments, :dependent => :delete_all
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
  #             "website"]
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
  #               prospect.website]
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
    ActiveRecord::Base.transaction do
    CSV.foreach(file.path, encoding: 'bom|utf-8', headers: true) do |row|
      # Use the following line to import just new prospects
      # Prospect.create! row.to_hash
      # Use The following 3 lines to update existing prospects
      prospect_hash = row.to_hash.select{ |k,v| v.present? }
      prospect = find_or_initialize_by(id: prospect_hash['id'])
      #binding.pry
      prospect.assign_attributes(prospect_hash.except('id'))
      prospect.save
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