require 'test_helper'

class DutyAssignmentsControllerTest < ActionController::TestCase
  setup do
    @duty_assignment = duty_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:duty_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create duty_assignment" do
    assert_difference('DutyAssignment.count') do
      post :create, duty_assignment: @duty_assignment.attributes
    end

    assert_redirected_to duty_assignment_path(assigns(:duty_assignment))
  end

  test "should show duty_assignment" do
    get :show, id: @duty_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @duty_assignment
    assert_response :success
  end

  test "should update duty_assignment" do
    put :update, id: @duty_assignment, duty_assignment: @duty_assignment.attributes
    assert_redirected_to duty_assignment_path(assigns(:duty_assignment))
  end

  test "should destroy duty_assignment" do
    assert_difference('DutyAssignment.count', -1) do
      delete :destroy, id: @duty_assignment
    end

    assert_redirected_to duty_assignments_path
  end
end
