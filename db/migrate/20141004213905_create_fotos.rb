class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :titulo
      t.references :entidade, index: true

      t.timestamps
    end
  end
end
