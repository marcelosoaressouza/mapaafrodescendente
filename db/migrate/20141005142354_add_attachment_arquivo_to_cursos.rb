class AddAttachmentArquivoToCursos < ActiveRecord::Migration
  def self.up
    change_table :cursos do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    remove_attachment :cursos, :arquivo
  end
end
