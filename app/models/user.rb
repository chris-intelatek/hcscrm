class User < ActiveRecord::Base
  has_many :prospects, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
        :trackable, :validatable, :timeoutable


  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << ["First Name", "Last Name", "Prospects", "Logged in", "Email", "Phone",
              "Mobile", "Group", "Manager", "Support"]
      all.each do |user|
        csv << [user.advisor_first_name, user.advisor_last_name, user.prospects.size, 
                user.current_sign_in_at, user.email, user.advisor_phone,
                user.advisor_mobile, user.group, user.manager, user.support]
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
    [advisor_first_name, advisor_last_name].select(&:present?).join(' ')
  end
  
  def self.collection
    order(:advisor_first_name).map { |u| [u.advisor_name, u.id] }
  end

end