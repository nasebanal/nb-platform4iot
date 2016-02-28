require 'test_helper'

class ProcmodesControllerTest < ActionController::TestCase
  setup do
    @procmode = procmodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:procmodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create procmode" do
    assert_difference('Procmode.count') do
      post :create, procmode: { name: @procmode.name }
    end

    assert_redirected_to procmode_path(assigns(:procmode))
  end

  test "should show procmode" do
    get :show, id: @procmode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @procmode
    assert_response :success
  end

  test "should update procmode" do
    patch :update, id: @procmode, procmode: { name: @procmode.name }
    assert_redirected_to procmode_path(assigns(:procmode))
  end

  test "should destroy procmode" do
    assert_difference('Procmode.count', -1) do
      delete :destroy, id: @procmode
    end

    assert_redirected_to procmodes_path
  end
end
