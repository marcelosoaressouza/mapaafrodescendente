require 'test_helper'

class EntidadesControllerTest < ActionController::TestCase
  setup do
    @entidade = entidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entidade" do
    assert_difference('Entidade.count') do
      post :create, entidade: { capoeira: @entidade.capoeira, descricao: @entidade.descricao, descritor: @entidade.descritor, email: @entidade.email, endereco: @entidade.endereco, entidade: @entidade.entidade, estudio: @entidade.estudio, estudo_cultural: @entidade.estudo_cultural, evento: @entidade.evento, gesac: @entidade.gesac, grupo_mestre: @entidade.grupo_mestre, latitude: @entidade.latitude, longitude: @entidade.longitude, municipio: @entidade.municipio, nucleo_formacao: @entidade.nucleo_formacao, ponto_cultura: @entidade.ponto_cultura, quilombo: @entidade.quilombo, quilombo_urbano: @entidade.quilombo_urbano, radio: @entidade.radio, responsavel: @entidade.responsavel, roupa_acessorio: @entidade.roupa_acessorio, slug: @entidade.slug, telecentro: @entidade.telecentro, telefone: @entidade.telefone, terreiro: @entidade.terreiro, uf: @entidade.uf }
    end

    assert_redirected_to entidade_path(assigns(:entidade))
  end

  test "should show entidade" do
    get :show, id: @entidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entidade
    assert_response :success
  end

  test "should update entidade" do
    patch :update, id: @entidade, entidade: { capoeira: @entidade.capoeira, descricao: @entidade.descricao, descritor: @entidade.descritor, email: @entidade.email, endereco: @entidade.endereco, entidade: @entidade.entidade, estudio: @entidade.estudio, estudo_cultural: @entidade.estudo_cultural, evento: @entidade.evento, gesac: @entidade.gesac, grupo_mestre: @entidade.grupo_mestre, latitude: @entidade.latitude, longitude: @entidade.longitude, municipio: @entidade.municipio, nucleo_formacao: @entidade.nucleo_formacao, ponto_cultura: @entidade.ponto_cultura, quilombo: @entidade.quilombo, quilombo_urbano: @entidade.quilombo_urbano, radio: @entidade.radio, responsavel: @entidade.responsavel, roupa_acessorio: @entidade.roupa_acessorio, slug: @entidade.slug, telecentro: @entidade.telecentro, telefone: @entidade.telefone, terreiro: @entidade.terreiro, uf: @entidade.uf }
    assert_redirected_to entidade_path(assigns(:entidade))
  end

  test "should destroy entidade" do
    assert_difference('Entidade.count', -1) do
      delete :destroy, id: @entidade
    end

    assert_redirected_to entidades_path
  end
end
