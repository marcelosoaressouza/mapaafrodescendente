class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.string :convenio
      t.date :data_inicio
      t.date :data_fim
      t.string :categoria
      t.string :dificuldade
      t.string :impacto
      t.string :positivo
      t.string :parceiro
      t.references :entidade, index: true

      t.timestamps
    end
  end
end
