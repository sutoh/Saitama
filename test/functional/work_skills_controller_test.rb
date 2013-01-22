require 'test_helper'

class WorkSkillsControllerTest < ActionController::TestCase
  setup do
    @work_skill = work_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_skill" do
    assert_difference('WorkSkill.count') do
      post :create, work_skill: { skill_id: @work_skill.skill_id, work_detail_id: @work_skill.work_detail_id }
    end

    assert_redirected_to work_skill_path(assigns(:work_skill))
  end

  test "should show work_skill" do
    get :show, id: @work_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_skill
    assert_response :success
  end

  test "should update work_skill" do
    put :update, id: @work_skill, work_skill: { skill_id: @work_skill.skill_id, work_detail_id: @work_skill.work_detail_id }
    assert_redirected_to work_skill_path(assigns(:work_skill))
  end

  test "should destroy work_skill" do
    assert_difference('WorkSkill.count', -1) do
      delete :destroy, id: @work_skill
    end

    assert_redirected_to work_skills_path
  end
end
