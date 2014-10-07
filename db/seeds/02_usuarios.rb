# encoding: utf-8

seed_data = "#{Rails.root}/db/seeds/seed_data/"

File.open(seed_data + 'usuarios.txt').each_with_index do |linha, index|
  email, password, admin = linha.chomp.split("|")
  puts "Importando Usuário #{index} - #{email}"

  User.create!(:email => email, :password => password, :password_confirmation => password, :admin => admin)
end
