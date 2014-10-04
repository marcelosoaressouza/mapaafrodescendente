Rails.application.routes.draw do
  resources :entidades

  devise_for :users

  get 'principal/index'

  root 'principal#index'
end
