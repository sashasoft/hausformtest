require 'test_helper'

class KarkasdomsControllerTest < ActionController::TestCase
  setup do
    @karkasdom = karkasdoms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:karkasdoms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create karkasdom" do
    assert_difference('Karkasdom.count') do
      post :create, karkasdom: {  }
    end

    assert_redirected_to karkasdom_path(assigns(:karkasdom))
  end

  test "should show karkasdom" do
    get :show, id: @karkasdom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @karkasdom
    assert_response :success
  end

  test "should update karkasdom" do
    patch :update, id: @karkasdom, karkasdom: {  }
    assert_redirected_to karkasdom_path(assigns(:karkasdom))
  end

  test "should destroy karkasdom" do
    assert_difference('Karkasdom.count', -1) do
      delete :destroy, id: @karkasdom
    end

    assert_redirected_to karkasdoms_path
  end
end
