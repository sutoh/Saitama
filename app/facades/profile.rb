class Profile
	attr_reader :employee

	def employee_skills_find_first()
		employee.employee_skills.find(:first)
	end

	def employee_licenses_find_first()
		employee.employee_licenses.find(:first)
	end

	def initialize(employee)
		@employee = employee
		self.attr_reader_employee :address, :birthday, :del_flg, :department_id, :education, 
                  :entrance_date, :experience, :family_name, :family_name_kana, 
                  :gender, :given_name, :given_name_kana, :postalcode, :self_pr,
                  :staff_flg, :station, :tech_flg, :latitude, :longitude, :gmaps, 
                  :image, :id, :employee_skills, :employee_licenses, :fullname, 
                  :fullname_kana, :gender_judge, :licenses, :skills, :to_gmaps4rails, :works

	end

	def login_id()
		employee.user.login_id if !employee.user.nil?
	end

	def work_details()
		employee.works.map {|w| w.work_details.all}.flatten
	end

	protected
	def attr_reader_employee(*syms)
		syms.each do |sym|
			class_eval <<-EOS
				def #{sym}
					employee.#{sym}
				end
			EOS
		end
	end
end