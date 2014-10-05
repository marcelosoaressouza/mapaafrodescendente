class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @dados = Entidade.friendly.find(params[:entidade_id])
    @videos = Video.where("entidade_id = ?", @dados.id)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /videos/new
  def new
    @video = Video.new
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /videos/1/edit
  def edit
     @dados = Entidade.friendly.find(params[:entidade_id])
 end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @dados = Entidade.friendly.find(params[:entidade_id])

    respond_to do |format|
      if @video.save
        format.html { redirect_to entidade_videos_path, notice: 'Video foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to entidade_videos_path, notice: 'Video foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to entidade_videos_url, notice: 'Video foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:titulo, :entidade_id, :arquivo)
    end
end
