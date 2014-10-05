class Texto < ActiveRecord::Base
  belongs_to :entidade
  has_attached_file :arquivo,
                    :url  => "/textos/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/textos/:id/:basename_:style.:extension"

  validates_attachment_content_type :arquivo, :content_type => /.*/  

  validates :titulo, :presence => true

end
