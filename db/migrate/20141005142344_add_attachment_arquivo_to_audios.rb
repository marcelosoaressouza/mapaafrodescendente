class AddAttachmentArquivoToAudios < ActiveRecord::Migration
  def self.up
    change_table :audios do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :audios, :arquivo
  end
end
