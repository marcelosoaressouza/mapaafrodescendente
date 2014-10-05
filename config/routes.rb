Rails.application.routes.draw do
  resources :projetos

  get 'municipios/index'

  resources :entidades do
    resources :fotos,  :controller => "fotos"
    resources :projetos,  :controller => "projetos"
  end


  devise_for :users

  get 'principal/index'

  root 'principal#index'
  get '/ufs/:sigla/municipios', :to => 'municipios#index'
end
