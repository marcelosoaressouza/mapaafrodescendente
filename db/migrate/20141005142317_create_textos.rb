class CreateTextos < ActiveRecord::Migration
  def change
    create_table :textos do |t|
      t.string :titulo
      t.references :entidade, index: true

      t.timestamps
    end
  end
end
