require 'test_helper'

class WorkDetailsControllerTest < ActionController::TestCase
  setup do
    @work_detail = work_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_detail" do
    assert_difference('WorkDetail.count') do
      post :create, work_detail: { job_class: @work_detail.job_class, period_form: @work_detail.period_form, period_to: @work_detail.period_to, personnel_num: @work_detail.personnel_num, role: @work_detail.role, subject: @work_detail.subject, title: @work_detail.title, work_class: @work_detail.work_class, work_id: @work_detail.work_id, work_role: @work_detail.work_role }
    end

    assert_redirected_to work_detail_path(assigns(:work_detail))
  end

  test "should show work_detail" do
    get :show, id: @work_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_detail
    assert_response :success
  end

  test "should update work_detail" do
    put :update, id: @work_detail, work_detail: { job_class: @work_detail.job_class, period_form: @work_detail.period_form, period_to: @work_detail.period_to, personnel_num: @work_detail.personnel_num, role: @work_detail.role, subject: @work_detail.subject, title: @work_detail.title, work_class: @work_detail.work_class, work_id: @work_detail.work_id, work_role: @work_detail.work_role }
    assert_redirected_to work_detail_path(assigns(:work_detail))
  end

  test "should destroy work_detail" do
    assert_difference('WorkDetail.count', -1) do
      delete :destroy, id: @work_detail
    end

    assert_redirected_to work_details_path
  end
end
