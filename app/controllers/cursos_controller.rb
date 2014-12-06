class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /cursos
  # GET /cursos.json
  def index
    @dados = Entidade.friendly.find(params[:entidade_id])
    @cursos = Curso.where("entidade_id = ?", @dados.id)
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
    @dados = Entidade.friendly.find(params[:entidade_id])
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_cursos_url)
  end

  # GET /cursos/1/edit
  def edit
    @dados = Entidade.friendly.find(params[:entidade_id])
    return false if !owner_verify(@dados, entidade_cursos_url)
 end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(curso_params)
    @dados = Entidade.friendly.find(params[:entidade_id])

    respond_to do |format|
      if @curso.save
        format.html { redirect_to entidade_cursos_path, notice: 'Curso foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to entidade_cursos_path, notice: 'Curso foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to entidade_cursos_url, notice: 'Curso foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:titulo, :entidade_id, :arquivo, :tag_list)
    end
end
