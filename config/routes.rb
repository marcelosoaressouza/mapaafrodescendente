Rails.application.routes.draw do
  get 'municipios/index'

  resources :entidades

  devise_for :users

  get 'principal/index'

  root 'principal#index'
  get '/ufs/:sigla/municipios', :to => 'municipios#index'
end
