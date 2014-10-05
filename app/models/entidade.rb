class Entidade < ActiveRecord::Base
  extend FriendlyId
  friendly_id :entidade, use: :slugged

  geocoded_by :localizacao 
  after_validation :geocode 

  def localizacao
     "#{self.municipio}, #{self.uf}, Brasil"
  end

  has_many :fotos,    :dependent => :destroy
  has_many :audios,   :dependent => :destroy
  has_many :videos,   :dependent => :destroy
  has_many :textos,   :dependent => :destroy
  has_many :cursos,   :dependent => :destroy
  has_many :projetos, :dependent => :destroy
end
