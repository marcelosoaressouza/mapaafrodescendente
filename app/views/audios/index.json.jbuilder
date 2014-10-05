json.array!(@audios) do |audio|
  json.extract! audio, :id, :titulo, :entidade_id
  json.url audio_url(audio, format: :json)
end
