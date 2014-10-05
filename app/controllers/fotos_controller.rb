class FotosController < ApplicationController
  before_action :set_foto, only: [:show, :edit, :update, :destroy]

  # GET /fotos
  # GET /fotos.json
  def index
    @dados = Entidade.friendly.find(params[:entidade_id])
    @fotos = Foto.where("entidade_id = ?", @dados.id)
  end

  # GET /fotos/1
  # GET /fotos/1.json
  def show
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /fotos/new
  def new
    @foto = Foto.new
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /fotos/1/edit
  def edit
     @dados = Entidade.friendly.find(params[:entidade_id])
 end

  # POST /fotos
  # POST /fotos.json
  def create
    @foto = Foto.new(foto_params)
    @dados = Entidade.friendly.find(params[:entidade_id])

    respond_to do |format|
      if @foto.save
        format.html { redirect_to entidade_fotos_path, notice: 'Foto foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @foto }
      else
        format.html { render :new }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fotos/1
  # PATCH/PUT /fotos/1.json
  def update
    respond_to do |format|
      if @foto.update(foto_params)
        format.html { redirect_to entidade_fotos_path, notice: 'Foto foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @foto }
      else
        format.html { render :edit }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.json
  def destroy
    @foto.destroy
    respond_to do |format|
      format.html { redirect_to entidade_fotos_url, notice: 'Foto foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foto
      @foto = Foto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foto_params
      params.require(:foto).permit(:titulo, :entidade_id, :imagem)
    end
end