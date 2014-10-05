class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /audios
  # GET /audios.json
  def index
    @dados = Entidade.friendly.find(params[:entidade_id])
    @audios = Audio.where("entidade_id = ?", @dados.id)
  end

  # GET /audios/1
  # GET /audios/1.json
  def show
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /audios/new
  def new
    @audio = Audio.new
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_audios_url)
  end

  # GET /audios/1/edit
  def edit
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_audios_url)
 end

  # POST /audios
  # POST /audios.json
  def create
    @audio = Audio.new(audio_params)
    @dados = Entidade.friendly.find(params[:entidade_id])

    respond_to do |format|
      if @audio.save
        format.html { redirect_to entidade_audios_path, notice: 'Audio foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @audio }
      else
        format.html { render :new }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audios/1
  # PATCH/PUT /audios/1.json
  def update
    respond_to do |format|
      if @audio.update(audio_params)
        format.html { redirect_to entidade_audios_path, notice: 'Audio foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @audio }
      else
        format.html { render :edit }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audios/1
  # DELETE /audios/1.json
  def destroy
    @audio.destroy
    respond_to do |format|
      format.html { redirect_to entidade_audios_url, notice: 'Audio foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio
      @audio = Audio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_params
      params.require(:audio).permit(:titulo, :entidade_id, :arquivo)
    end
end
