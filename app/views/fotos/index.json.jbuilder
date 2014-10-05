json.array!(@fotos) do |foto|
  json.extract! foto, :id, :titulo, :entidade_id
  json.url foto_url(foto, format: :json)
end
