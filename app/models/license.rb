class License < ActiveRecord::Base
  attr_accessible :name, :note, :publisher, :validity_term
  has_many :employee_licenses

  #Validates
  validates :name,presence: true, length: {maximum: 50, minimum: 1}	
  validates :note,length: {maximum: 100}	
  validates :publisher,presence: true,  length: {maximum: 25, minimum: 1}	
  validates :validity_term, length: {maximum: 10}	

end
