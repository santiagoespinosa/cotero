require 'test_helper'

class ItemListaControllerTest < ActionController::TestCase
  setup do
    @item_listum = item_lista(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_lista)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_listum" do
    assert_difference('ItemListum.count') do
      post :create, item_listum: { item_id: @item_listum.item_id, listum_id: @item_listum.listum_id }
    end

    assert_redirected_to item_listum_path(assigns(:item_listum))
  end

  test "should show item_listum" do
    get :show, id: @item_listum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_listum
    assert_response :success
  end

  test "should update item_listum" do
    patch :update, id: @item_listum, item_listum: { item_id: @item_listum.item_id, listum_id: @item_listum.listum_id }
    assert_redirected_to item_listum_path(assigns(:item_listum))
  end

  test "should destroy item_listum" do
    assert_difference('ItemListum.count', -1) do
      delete :destroy, id: @item_listum
    end

    assert_redirected_to item_lista_path
  end
end
