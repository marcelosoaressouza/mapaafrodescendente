json.array!(@entidades) do |entidade|
  json.extract! entidade, :id, :entidade, :slug, :email, :responsavel, :municipio, :uf, :endereco, :telefone, :descricao, :descritor, :telecentro, :gesac, :ponto_cultura, :estudo_cultural, :quilombo, :quilombo_urbano, :capoeira, :terreiro, :nucleo_formacao, :grupo_mestre, :radio, :estudio, :roupa_acessorio, :evento, :latitude, :longitude
  json.url entidade_url(entidade, format: :json)
end
