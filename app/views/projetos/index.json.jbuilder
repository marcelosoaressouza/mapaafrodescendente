json.array!(@projetos) do |projeto|
  json.extract! projeto, :id, :nome, :convenio, :data_inicio, :data_fim, :categoria, :dificuldade, :impacto, :positivo, :parceiro, :entidade_id
  json.url projeto_url(projeto, format: :json)
end
