# encoding: utf-8

#entidade = Entidade.create! :entidade => 'Teste',
#                            :email => 'admin@localhost.org',
#                            :responsavel => 'Testando',
#                            :municipio => 'Salvador',
#                            :uf => 'BA',
#                            :endereco => 'Avenida Paulo VI',
#                            :telefone => '99999999',
#                            :descricao => 'Nenhuma',
#                            :descritor => 'Nenhum',
#                            :telecentro => true,
#                            :gesac => false,
#                            :ponto_cultura => false,
#                            :estudo_cultural => false,
#                            :quilombo => false,
#                            :quilombo_urbano => false,
#                            :capoeira => false,
#                            :terreiro => false,
#                            :nucleo_formacao => false,
#                            :grupo_mestre => false,
#                            :radio => false,
#                            :estudio => false,
#                            :roupa_acessorio => false,
#                            :evento => false


seed_data = "#{Rails.root}/db/seeds/seed_data/"

File.open(seed_data + 'entidades.txt').each_with_index do |linha, index|
  entidade, municipio, uf, telecentro, gesac, ponto_cultura, estudo_cultural, quilombo, quilombo_urbano, capoeira, terreiro, nucleo_formacao, grupo_mestre, radio, estudio, roupa_acessorio, evento, endereco, endereco_checar, telefone, email, responsavel, descritor, descricao = linha.chomp.split("|")

  puts "Importando Entidade #{index} - #{entidade}"

  Entidade.create!(:entidade => entidade,
                   :municipio => municipio,
                   :uf => uf,
                   :telecentro => telecentro,
                   :gesac => gesac,
                   :ponto_cultura => ponto_cultura,
                   :estudo_cultural => estudo_cultural,
                   :quilombo => quilombo,
                   :quilombo_urbano => quilombo_urbano,
                   :capoeira => capoeira,
                   :terreiro => terreiro,
                   :nucleo_formacao => nucleo_formacao,
                   :grupo_mestre => grupo_mestre,
                   :radio => radio,
                   :estudio => estudio,
                   :roupa_acessorio => roupa_acessorio,
                   :evento => evento,
                   :endereco => endereco,
                   :telefone => telefone,
                   :email => email,
                   :responsavel => responsavel,
                   :descritor => descritor,
                   :descricao => :descricao)
end

