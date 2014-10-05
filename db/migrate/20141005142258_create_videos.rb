class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :titulo
      t.references :entidade, index: true

      t.timestamps
    end
  end
end
