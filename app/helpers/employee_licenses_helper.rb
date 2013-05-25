module EmployeeLicensesHelper
	def licenseList
		License.find(:all, :select => "Licenses.name, Licenses.id")
	end
end
