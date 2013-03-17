class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login_id, :employee_id, :role_id
  # attr_accessible :title, :body
  has_one :employee
  before_create :create_employee

  def create_employee
    employee = Employee.new
    employee.family_name = "default"
    employee.given_name = "default"
    employee.family_name_kana = "default"
    employee.given_name_kana = "default"
    self.employee = employee
  end


  def email_required?
		false
	end
end
