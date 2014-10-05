class AddAttachmentImagemToFotos < ActiveRecord::Migration
  def self.up
    change_table :fotos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :fotos, :imagem
  end
end
