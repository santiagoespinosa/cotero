require 'test_helper'

class CategoriaProveedorsControllerTest < ActionController::TestCase
  setup do
    @categoria_proveedor = categoria_proveedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoria_proveedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoria_proveedor" do
    assert_difference('CategoriaProveedor.count') do
      post :create, categoria_proveedor: { categorium_id: @categoria_proveedor.categorium_id, proveedor_id: @categoria_proveedor.proveedor_id }
    end

    assert_redirected_to categoria_proveedor_path(assigns(:categoria_proveedor))
  end

  test "should show categoria_proveedor" do
    get :show, id: @categoria_proveedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoria_proveedor
    assert_response :success
  end

  test "should update categoria_proveedor" do
    patch :update, id: @categoria_proveedor, categoria_proveedor: { categorium_id: @categoria_proveedor.categorium_id, proveedor_id: @categoria_proveedor.proveedor_id }
    assert_redirected_to categoria_proveedor_path(assigns(:categoria_proveedor))
  end

  test "should destroy categoria_proveedor" do
    assert_difference('CategoriaProveedor.count', -1) do
      delete :destroy, id: @categoria_proveedor
    end

    assert_redirected_to categoria_proveedors_path
  end
end
