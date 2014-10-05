class Projeto < ActiveRecord::Base
  belongs_to :entidade

  validates :nome, :presence => true

end
