require 'test_helper'

class TrialsControllerTest < ActionController::TestCase
  setup do
    @trial = trials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trial" do
    assert_difference('Trial.count') do
      post :create, trial: { abogado_patrono_apellido_materno: @trial.abogado_patrono_apellido_materno, abogado_patrono_apellido_paterno: @trial.abogado_patrono_apellido_paterno, abogado_patrono_nombre: @trial.abogado_patrono_nombre, actor_apellido_materno: @trial.actor_apellido_materno, actor_apellido_paterno: @trial.actor_apellido_paterno, actor_nombre: @trial.actor_nombre, comentario: @trial.comentario, demandado_apellido_materno: @trial.demandado_apellido_materno, demandado_apellido_paterno: @trial.demandado_apellido_paterno, demandado_nombre: @trial.demandado_nombre, distrito_judicial: @trial.distrito_judicial, estado_procesal: @trial.estado_procesal, fecha_vencimiento_termino: @trial.fecha_vencimiento_termino, juzgado: @trial.juzgado, numero_expediente: @trial.numero_expediente, tipo_juicio: @trial.tipo_juicio, ultima_actuacion: @trial.ultima_actuacion }
    end

    assert_redirected_to trial_path(assigns(:trial))
  end

  test "should not create trial"

  test "should show trial" do
    get :show, id: @trial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trial
    assert_response :success
  end

  test "should update trial" do
    patch :update, id: @trial, trial: { abogado_patrono_apellido_materno: @trial.abogado_patrono_apellido_materno, abogado_patrono_apellido_paterno: @trial.abogado_patrono_apellido_paterno, abogado_patrono_nombre: @trial.abogado_patrono_nombre, actor_apellido_materno: @trial.actor_apellido_materno, actor_apellido_paterno: @trial.actor_apellido_paterno, actor_nombre: @trial.actor_nombre, comentario: @trial.comentario, demandado_apellido_materno: @trial.demandado_apellido_materno, demandado_apellido_paterno: @trial.demandado_apellido_paterno, demandado_nombre: @trial.demandado_nombre, distrito_judicial: @trial.distrito_judicial, estado_procesal: @trial.estado_procesal, fecha_vencimiento_termino: @trial.fecha_vencimiento_termino, juzgado: @trial.juzgado, numero_expediente: @trial.numero_expediente, tipo_juicio: @trial.tipo_juicio, ultima_actuacion: @trial.ultima_actuacion }
    assert_redirected_to trial_path(assigns(:trial))
  end

  test "should destroy trial" do
    assert_difference('Trial.count', -1) do
      delete :destroy, id: @trial
    end

    assert_redirected_to trials_path
  end
end
