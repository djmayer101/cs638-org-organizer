require 'test_helper'

class PositionAssignmentsControllerTest < ActionController::TestCase
  setup do
    @position_assignment = position_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:position_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position_assignment" do
    assert_difference('PositionAssignment.count') do
      post :create, position_assignment: @position_assignment.attributes
    end

    assert_redirected_to position_assignment_path(assigns(:position_assignment))
  end

  test "should show position_assignment" do
    get :show, id: @position_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position_assignment
    assert_response :success
  end

  test "should update position_assignment" do
    put :update, id: @position_assignment, position_assignment: @position_assignment.attributes
    assert_redirected_to position_assignment_path(assigns(:position_assignment))
  end

  test "should destroy position_assignment" do
    assert_difference('PositionAssignment.count', -1) do
      delete :destroy, id: @position_assignment
    end

    assert_redirected_to position_assignments_path
  end
end
