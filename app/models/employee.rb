class Employee < ActiveRecord::Base
  acts_as_gmappable
  
  attr_accessible :address, :birthday, :del_flg, :department_id, :education, 
                  :entrance_date, :experience, :family_name, :family_name_kana, 
                  :gender, :given_name, :given_name_kana, :postalcode, :self_pr,
                  :staff_flg, :station, :tech_flg, :latitude, :longitude, :gmaps, 
                  :image
  has_many :employee_licenses
  has_many :licenses, :through => :employee_licenses, :uniq => true
  has_many :employee_skills
  has_many :skills, :through => :employee_skills, :uniq => true
  belongs_to :department
  has_many :works
  belongs_to :user
  
  has_attached_file :image,
                    :styles => { :medium => "300x300", :thumb => "100x100" },
                    :default_url => "/images/:style/missing.png"

  #Validate
  validates :family_name, presence: true, length: {maximum: 20, minimum: 1}
  validates :given_name, presence: true, length: {maximum: 20, minimum: 1}
  validates :gender, allow_blank: true, numericality: true, inclusion: {in: 0..1}
  validates :experience, allow_blank: true, numericality: true, inclusion: {in: 0..99}
  validates :postalcode, allow_blank: true, format: /[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]/
  validates :address, presence: true,length: {maximum: 200, minimum: 5}
  validates :tech_flg, allow_blank: true, numericality: true, inclusion: {in: 1..2}
  validates :staff_flg, allow_blank: true, numericality: true, inclusion: {in: 1..4}


  def full_name
    family_name + " " + given_name 
  end
  
  def gmaps4rails_address
    "#{self.address}"
  end
  def gmaps4rails_infowindow
    "<h3>#{full_name}</h3>"
  end
end
