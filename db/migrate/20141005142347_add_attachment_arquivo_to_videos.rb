class AddAttachmentArquivoToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :videos, :arquivo
  end
end
