module WorksHelper
  def full_name(f,g)
    _f = f || ""
    _g = g || ""
    _f + " " + _g
  end
  def staff_name(staff_id)
    staff = Employee.find(staff_id)
    full_name(staff.family_name,staff.given_name)
  end
end
