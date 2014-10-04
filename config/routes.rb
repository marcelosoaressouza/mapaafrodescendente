Rails.application.routes.draw do
  devise_for :users

  get 'principal/index'

  root 'principal#index'
end
