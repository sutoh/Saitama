class License < ActiveRecord::Base
  attr_accessible :name, :note, :publisher, :validity_term
  has_many :employee_licenses
end
