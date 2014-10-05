class AddAttachmentArquivoToTextos < ActiveRecord::Migration
  def self.up
    change_table :textos do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :textos, :arquivo
  end
end
