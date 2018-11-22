class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true
  validates :employees, :numericality => {:only_integer => true}
  delegate :email, to: :user, allow_nil: true, prefix: true


  def self.to_csv
    attributes = %w[advisor_first_name advisor_last_name organization]

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