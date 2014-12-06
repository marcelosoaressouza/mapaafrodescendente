class Curso < ActiveRecord::Base
  belongs_to :entidade
  has_attached_file :arquivo,
                    :url  => "/cursos/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/cursos/:id/:basename_:style.:extension"

  validates_attachment_content_type :arquivo, :content_type => /.*/  

  validates :titulo, :presence => true

  acts_as_taggable_on :tags
end
