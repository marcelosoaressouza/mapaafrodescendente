class Entidade < ActiveRecord::Base
  extend FriendlyId
  friendly_id :entidade, use: :slugged

  geocoded_by :localizacao 
  after_validation :geocode 

  def localizacao
     "#{self.municipio}, #{self.uf}, Brasil"
  end

  has_many :fotos
  has_many :projetos
end
