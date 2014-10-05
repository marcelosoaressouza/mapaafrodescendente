json.array!(@cursos) do |curso|
  json.extract! curso, :id, :titulo, :entidade_id
  json.url curso_url(curso, format: :json)
end
