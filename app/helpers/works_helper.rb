module WorksHelper
  def staff_name(staff_id)
    staff = Employee.find(staff_id)
    staff.fullname
  end
end
