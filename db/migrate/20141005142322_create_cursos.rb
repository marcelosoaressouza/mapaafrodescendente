class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.references :entidade, index: true

      t.timestamps
    end
  end
end
