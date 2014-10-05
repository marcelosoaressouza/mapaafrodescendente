class Video < ActiveRecord::Base
  belongs_to :entidade
  has_attached_file :arquivo,
                    :url  => "/videos/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/videos/:id/:basename_:style.:extension"

  validates_attachment_content_type :arquivo, :content_type => /.*/  

  validates :titulo, :presence => true

end
