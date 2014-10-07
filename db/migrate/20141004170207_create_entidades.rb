class CreateEntidades < ActiveRecord::Migration
  def change
    create_table :entidades do |t|
      t.string :entidade
      t.string :slug
      t.string :email
      t.string :responsavel
      t.string :municipio
      t.string :uf
      t.string :endereco
      t.string :telefone
      t.text :descricao
      t.string :descritor
      t.boolean :telecentro
      t.boolean :gesac
      t.boolean :ponto_cultura
      t.boolean :estudo_cultural
      t.boolean :quilombo
      t.boolean :quilombo_urbano
      t.boolean :capoeira
      t.boolean :terreiro
      t.boolean :nucleo_formacao
      t.boolean :grupo_mestre
      t.boolean :radio
      t.boolean :estudio
      t.boolean :roupa_acessorio
      t.boolean :evento
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :entidades, :slug, unique: true
  end
end
