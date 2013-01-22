require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { address: @employee.address, birthday: @employee.birthday, del_flg: @employee.del_flg, department_id: @employee.department_id, education: @employee.education, entrance_date: @employee.entrance_date, experience: @employee.experience, family_name: @employee.family_name, family_name_kana: @employee.family_name_kana, gender: @employee.gender, given_name: @employee.given_name, given_name_kana: @employee.given_name_kana, postalcode: @employee.postalcode, self_pr: @employee.self_pr, staff_flg: @employee.staff_flg, station: @employee.station, tech_flg: @employee.tech_flg }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: { address: @employee.address, birthday: @employee.birthday, del_flg: @employee.del_flg, department_id: @employee.department_id, education: @employee.education, entrance_date: @employee.entrance_date, experience: @employee.experience, family_name: @employee.family_name, family_name_kana: @employee.family_name_kana, gender: @employee.gender, given_name: @employee.given_name, given_name_kana: @employee.given_name_kana, postalcode: @employee.postalcode, self_pr: @employee.self_pr, staff_flg: @employee.staff_flg, station: @employee.station, tech_flg: @employee.tech_flg }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
