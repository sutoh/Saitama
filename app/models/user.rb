class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :login_id, :employee_id, :role_id, :employee_attributes
  # attr_accessible :title, :body
  has_one :employee, dependent: :destroy
  accepts_nested_attributes_for :employee, allow_destroy: true

  def email_required?
		false
	end
end
