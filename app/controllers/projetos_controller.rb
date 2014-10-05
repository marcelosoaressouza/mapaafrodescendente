class ProjetosController < ApplicationController
  before_action :set_projeto, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /projetos
  # GET /projetos.json
  def index
    @dados = Entidade.friendly.find(params[:entidade_id])
    @projetos = Projeto.where("entidade_id = ?", @dados.id)
  end

  # GET /projetos/1
  # GET /projetos/1.json
  def show
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /projetos/new
  def new
    @projeto = Projeto.new
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_projetos_url)
  end

  # GET /projetos/1/edit
  def edit
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_projetos_url)
  end

  # POST /projetos
  # POST /projetos.json
  def create
    @projeto = Projeto.new(projeto_params)
    @dados = Entidade.friendly.find(params[:entidade_id])

    respond_to do |format|
      if @projeto.save
        format.html { redirect_to entidade_projetos_path, notice: 'Projeto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @projeto }
      else
        format.html { render :new }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projetos/1
  # PATCH/PUT /projetos/1.json
  def update
    @dados = Entidade.friendly.find(params[:entidade_id])
    respond_to do |format|
      if @projeto.update(projeto_params)
        format.html { redirect_to entidade_projetos_path, notice: 'Projeto foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @projeto }
      else
        format.html { render :edit }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projetos/1
  # DELETE /projetos/1.json
  def destroy
    @projeto.destroy
    respond_to do |format|
      format.html { redirect_to entidade_projetos_url, notice: 'Projeto foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projeto
      @projeto = Projeto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projeto_params
      params.require(:projeto).permit(:nome, :convenio, :data_inicio, :data_fim, :categoria, :dificuldade, :impacto, :positivo, :parceiro, :entidade_id)
    end
end
