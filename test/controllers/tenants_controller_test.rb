require 'test_helper'

class TenantsControllerTest < ActionController::TestCase
  setup do
    @tenant = tenants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant" do
    assert_difference('Tenant.count') do
      post :create, tenant: { apellido_materno: @tenant.apellido_materno, apellido_paterno: @tenant.apellido_paterno, arrendador_actual: @tenant.arrendador_actual, arrendador_anterior: @tenant.arrendador_anterior, calle: @tenant.calle, ciudad: @tenant.ciudad, codigo_postal: @tenant.codigo_postal, colonia: @tenant.colonia, curp: @tenant.curp, delegacion: @tenant.delegacion, domicilio: @tenant.domicilio, domicilio_anterior: @tenant.domicilio_anterior, domicilio_aval: @tenant.domicilio_aval, estado: @tenant.estado, estado_civil: @tenant.estado_civil, ife: @tenant.ife, municipio: @tenant.municipio, no_exterior: @tenant.no_exterior, no_interior: @tenant.no_interior, nombre: @tenant.nombre, nombre_aval: @tenant.nombre_aval, telefono_aval: @tenant.telefono_aval, telefono_casa: @tenant.telefono_casa, telefono_movil: @tenant.telefono_movil }
    end

    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should show tenant" do
    get :show, id: @tenant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant
    assert_response :success
  end

  test "should update tenant" do
    patch :update, id: @tenant, tenant: { apellido_materno: @tenant.apellido_materno, apellido_paterno: @tenant.apellido_paterno, arrendador_actual: @tenant.arrendador_actual, arrendador_anterior: @tenant.arrendador_anterior, calle: @tenant.calle, ciudad: @tenant.ciudad, codigo_postal: @tenant.codigo_postal, colonia: @tenant.colonia, curp: @tenant.curp, delegacion: @tenant.delegacion, domicilio: @tenant.domicilio, domicilio_anterior: @tenant.domicilio_anterior, domicilio_aval: @tenant.domicilio_aval, estado: @tenant.estado, estado_civil: @tenant.estado_civil, ife: @tenant.ife, municipio: @tenant.municipio, no_exterior: @tenant.no_exterior, no_interior: @tenant.no_interior, nombre: @tenant.nombre, nombre_aval: @tenant.nombre_aval, telefono_aval: @tenant.telefono_aval, telefono_casa: @tenant.telefono_casa, telefono_movil: @tenant.telefono_movil }
    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should destroy tenant" do
    assert_difference('Tenant.count', -1) do
      delete :destroy, id: @tenant
    end

    assert_redirected_to tenants_path
  end
end
