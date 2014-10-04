class PrincipalController < ApplicationController
  def index
    @entidades = Entidade.all
    @markers = []

    @entidades.each do |entidade| 
     @markers << { :latlng => [entidade.latitude, entidade.longitude], :popup => "<a href=\"/entidades/#{entidade.slug}\" > #{entidade.entidade} </a>" }
    end
  end
end
