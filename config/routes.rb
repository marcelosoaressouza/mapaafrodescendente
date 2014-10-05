Rails.application.routes.draw do
  get 'municipios/index'

  resources :entidades do
    resources :fotos,    :controller => "fotos"
    resources :projetos, :controller => "projetos"
    resources :cursos,   :controller => "cursos"
    resources :textos,   :controller => "textos"
    resources :audios,   :controller => "audios"
    resources :videos,   :controller => "videos"
  end

  devise_for :users

  get 'principal/index'

  root 'principal#index'
  get '/ufs/:sigla/municipios', :to => 'municipios#index'
  get '/entidades/lista/:tipo', :to => 'entidades#lista'
end
