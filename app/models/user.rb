class User < ActiveRecord::Base
  has_many :prospects, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.to_csv
    attributes = %w{advisor_first_name advisor_last_name advisor_phone advisor_mobile email group}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end

    
  def self.search(query)
    # Note that PostgreSQL is case specific for like when searching where sqlite3 is not
    where("LOWER(advisor_first_name) like ? OR LOWER(advisor_last_name) like ? OR LOWER(email) like ? OR LOWER(advisor_phone) like ? OR LOWER(advisor_mobile) like ?", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  end


  def password_required?
    false
  end
  
  def advisor_name
    [advisor_first_name, advisor_last_name].join(' ')
  end

end