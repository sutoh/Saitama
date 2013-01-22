class Customer < ActiveRecord::Base
  attr_accessible :address, :name, :phone_num, :postalcode, :website
  has_many :works
end
