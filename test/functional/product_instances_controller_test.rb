require 'test_helper'

class ProductInstancesControllerTest < ActionController::TestCase
  setup do
    @product_instance = product_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_instance" do
    assert_difference('ProductInstance.count') do
      post :create, product_instance: { active: @product_instance.active, description: @product_instance.description, image: @product_instance.image, price: @product_instance.price }
    end

    assert_redirected_to product_instance_path(assigns(:product_instance))
  end

  test "should show product_instance" do
    get :show, id: @product_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_instance
    assert_response :success
  end

  test "should update product_instance" do
    put :update, id: @product_instance, product_instance: { active: @product_instance.active, description: @product_instance.description, image: @product_instance.image, price: @product_instance.price }
    assert_redirected_to product_instance_path(assigns(:product_instance))
  end

  test "should destroy product_instance" do
    assert_difference('ProductInstance.count', -1) do
      delete :destroy, id: @product_instance
    end

    assert_redirected_to product_instances_path
  end
end
