class EntidadesController < ApplicationController
  before_action :set_entidade, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /entidades
  # GET /entidades.json
  def index
    @entidades = Entidade.all
  end

  # GET /entidades/1
  # GET /entidades/1.json
  def show
  end

  # GET /entidades/new
  def new
    @entidade = Entidade.new
  end

  # GET /entidades/1/edit
  def edit
  end

  # POST /entidades
  # POST /entidades.json
  def create
    @entidade = Entidade.new(entidade_params)

    respond_to do |format|
      if @entidade.save
        format.html { redirect_to @entidade, notice: 'Entidade foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @entidade }
      else
        format.html { render :new }
        format.json { render json: @entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entidades/1
  # PATCH/PUT /entidades/1.json
  def update
    respond_to do |format|
      if @entidade.update(entidade_params)
        format.html { redirect_to @entidade, notice: 'Entidade foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @entidade }
      else
        format.html { render :edit }
        format.json { render json: @entidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entidades/1
  # DELETE /entidades/1.json
  def destroy
    @entidade.destroy
    respond_to do |format|
      format.html { redirect_to entidades_url, notice: 'Entidade foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entidade
      @entidade = Entidade.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entidade_params
      params.require(:entidade).permit(:entidade, :slug, :email, :responsavel, :municipio, :uf, :endereco, :telefone, :descricao, :descritor, :telecentro, :gesac, :ponto_cultura, :estudo_cultural, :quilombo, :quilombo_urbano, :capoeira, :terreiro, :nucleo_formacao, :grupo_mestre, :radio, :estudio, :roupa_acessorio, :evento, :latitude, :longitude)
    end
end
