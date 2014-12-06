class PrincipalController < ApplicationController
  def index
    @entidades = Entidade.all
    @markers = []

    # @entidades.each do |entidade| 
    # @markers << { :latlng => [entidade.latitude, entidade.longitude], :popup => "<center><h3><a href=\"/entidades/#{entidade.slug}\" > #{entidade.entidade} </a></h3></center>" }
    # end
  end

  def tagged
    if params[:tag].present?
      @fotos = Foto.tagged_with(params[:tag])
    else
      @fotos = Foto.all
    end
  end
end
