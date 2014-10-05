json.array!(@textos) do |texto|
  json.extract! texto, :id, :titulo, :entidade_id
  json.url texto_url(texto, format: :json)
end
