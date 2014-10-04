class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.string :nome
      t.string :codigo_ibge
      t.integer :estado_id

      t.timestamps
    end
  end
end
