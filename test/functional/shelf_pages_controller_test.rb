require 'test_helper'

class ShelfPagesControllerTest < ActionController::TestCase
  setup do
    @shelf_page = shelf_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shelf_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shelf_page" do
    assert_difference('ShelfPage.count') do
      post :create, shelf_page: { content: @shelf_page.content, tags: @shelf_page.tags, title: @shelf_page.title }
    end

    assert_redirected_to shelf_page_path(assigns(:shelf_page))
  end

  test "should show shelf_page" do
    get :show, id: @shelf_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shelf_page
    assert_response :success
  end

  test "should update shelf_page" do
    put :update, id: @shelf_page, shelf_page: { content: @shelf_page.content, tags: @shelf_page.tags, title: @shelf_page.title }
    assert_redirected_to shelf_page_path(assigns(:shelf_page))
  end

  test "should destroy shelf_page" do
    assert_difference('ShelfPage.count', -1) do
      delete :destroy, id: @shelf_page
    end

    assert_redirected_to shelf_pages_path
  end
end
