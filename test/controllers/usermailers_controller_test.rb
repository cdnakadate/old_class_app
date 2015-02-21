require 'test_helper'

class UsermailersControllerTest < ActionController::TestCase
  setup do
    @usermailer = usermailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usermailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usermailer" do
    assert_difference('Usermailer.count') do
      post :create, usermailer: { email: @usermailer.email, login: @usermailer.login, name: @usermailer.name }
    end

    assert_redirected_to usermailer_path(assigns(:usermailer))
  end

  test "should show usermailer" do
    get :show, id: @usermailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usermailer
    assert_response :success
  end

  test "should update usermailer" do
    patch :update, id: @usermailer, usermailer: { email: @usermailer.email, login: @usermailer.login, name: @usermailer.name }
    assert_redirected_to usermailer_path(assigns(:usermailer))
  end

  test "should destroy usermailer" do
    assert_difference('Usermailer.count', -1) do
      delete :destroy, id: @usermailer
    end

    assert_redirected_to usermailers_path
  end
end
