require 'test_helper'

class ItemProveedorsControllerTest < ActionController::TestCase
  setup do
    @item_proveedor = item_proveedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_proveedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_proveedor" do
    assert_difference('ItemProveedor.count') do
      post :create, item_proveedor: { item_id: @item_proveedor.item_id, precio: @item_proveedor.precio, proveedor_id: @item_proveedor.proveedor_id }
    end

    assert_redirected_to item_proveedor_path(assigns(:item_proveedor))
  end

  test "should show item_proveedor" do
    get :show, id: @item_proveedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_proveedor
    assert_response :success
  end

  test "should update item_proveedor" do
    patch :update, id: @item_proveedor, item_proveedor: { item_id: @item_proveedor.item_id, precio: @item_proveedor.precio, proveedor_id: @item_proveedor.proveedor_id }
    assert_redirected_to item_proveedor_path(assigns(:item_proveedor))
  end

  test "should destroy item_proveedor" do
    assert_difference('ItemProveedor.count', -1) do
      delete :destroy, id: @item_proveedor
    end

    assert_redirected_to item_proveedors_path
  end
end
