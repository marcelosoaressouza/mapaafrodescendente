class TextosController < ApplicationController
  before_action :set_texto, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /textos
  # GET /textos.json
  def index
    @dados = Entidade.friendly.find(params[:entidade_id])
    @textos = Texto.where("entidade_id = ?", @dados.id)
  end

  # GET /textos/1
  # GET /textos/1.json
  def show
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /textos/new
  def new
    @texto = Texto.new
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_textos_url)
  end

  # GET /textos/1/edit
  def edit
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_textos_url)
 end

  # POST /textos
  # POST /textos.json
  def create
    @texto = Texto.new(texto_params)
    @dados = Entidade.friendly.find(params[:entidade_id])

    respond_to do |format|
      if @texto.save
        format.html { redirect_to entidade_textos_path, notice: 'Texto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @texto }
      else
        format.html { render :new }
        format.json { render json: @texto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textos/1
  # PATCH/PUT /textos/1.json
  def update
    respond_to do |format|
      if @texto.update(texto_params)
        format.html { redirect_to entidade_textos_path, notice: 'Texto foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @texto }
      else
        format.html { render :edit }
        format.json { render json: @texto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textos/1
  # DELETE /textos/1.json
  def destroy
    @texto.destroy
    respond_to do |format|
      format.html { redirect_to entidade_textos_url, notice: 'Texto foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texto
      @texto = Texto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def texto_params
      params.require(:texto).permit(:titulo, :entidade_id, :arquivo, :tag_list)
    end
end
