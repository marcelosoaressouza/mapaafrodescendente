class Audio < ActiveRecord::Base
  belongs_to :entidade
  has_attached_file :arquivo,
                    :url  => "/audios/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/audios/:id/:basename_:style.:extension"

  validates_attachment_content_type :arquivo, :content_type => /.*/
end
