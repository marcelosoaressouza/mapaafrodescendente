class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :titulo
      t.references :entidade, index: true

      t.timestamps
    end
  end
end
