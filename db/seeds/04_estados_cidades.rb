# encoding: utf-8

seed_data = "#{Rails.root}/db/seeds/seed_data/"

File.open(seed_data + 'ufs.txt').each_with_index do |linha, index|
  pais, sigla, nome, ibge = linha.chomp.split("|")
  puts "Importando UF #{index} - #{nome}"
  Uf.create!(:sigla => sigla, :nome => nome, :codigo_ibge => ibge )
end

File.open(seed_data + 'municipios.txt').each_with_index do |linha, index|
  estado, ibge, nome = linha.chomp.split("|")
  puts "Importando Munícipio #{index} - #{nome}"
  Municipio.create!(:estado_id => estado, :codigo_ibge => ibge, :nome => nome)
end

