require 'test_helper'

class ProductCoresControllerTest < ActionController::TestCase
  setup do
    @product_core = product_cores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_cores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_core" do
    assert_difference('ProductCore.count') do
      post :create, product_core: { active: @product_core.active, description: @product_core.description, image: @product_core.image, name: @product_core.name, price: @product_core.price, sku: @product_core.sku }
    end

    assert_redirected_to product_core_path(assigns(:product_core))
  end

  test "should show product_core" do
    get :show, id: @product_core
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_core
    assert_response :success
  end

  test "should update product_core" do
    put :update, id: @product_core, product_core: { active: @product_core.active, description: @product_core.description, image: @product_core.image, name: @product_core.name, price: @product_core.price, sku: @product_core.sku }
    assert_redirected_to product_core_path(assigns(:product_core))
  end

  test "should destroy product_core" do
    assert_difference('ProductCore.count', -1) do
      delete :destroy, id: @product_core
    end

    assert_redirected_to product_cores_path
  end
end
