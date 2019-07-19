Rails.application.routes.draw do


  get   '/profile',       to: 'users#show'
  get   '/signup',        to: 'users#new'
  post  '/signup',        to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
