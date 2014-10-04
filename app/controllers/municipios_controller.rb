class MunicipiosController < ApplicationController
  def index
    @municipios = Municipio.from("municipios, ufs as estado").where("estado.nome ILIKE ?", params[:sigla]).where("estado.id = municipios.estado_id")

    respond_to do |format|
      format.json  { render :json => @municipios }
    end
  end
end
