require 'test_helper'

class AbonosControllerTest < ActionController::TestCase
  setup do
    @abono = abonos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:abonos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create abono" do
    assert_difference('Abono.count') do
      post :create, abono: { comentario: @abono.comentario, monto: @abono.monto, pedido_id: @abono.pedido_id, proveedor_id: @abono.proveedor_id, user_id: @abono.user_id }
    end

    assert_redirected_to abono_path(assigns(:abono))
  end

  test "should show abono" do
    get :show, id: @abono
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @abono
    assert_response :success
  end

  test "should update abono" do
    patch :update, id: @abono, abono: { comentario: @abono.comentario, monto: @abono.monto, pedido_id: @abono.pedido_id, proveedor_id: @abono.proveedor_id, user_id: @abono.user_id }
    assert_redirected_to abono_path(assigns(:abono))
  end

  test "should destroy abono" do
    assert_difference('Abono.count', -1) do
      delete :destroy, id: @abono
    end

    assert_redirected_to abonos_path
  end
end
