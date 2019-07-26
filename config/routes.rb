# frozen_string_literal: true

Rails.application.routes.draw do

  root    'static_pages#home'

  get     '/home',         to: 'static_pages#home'

  get     '/events/new',   to: 'events#new'
  post    '/events/new',   to: 'events#create'
  get     '/event',        to: 'events#show'
  get     '/events',       to: 'events#index'

  get     '/login',        to: 'sessions#new'
  post    '/login',        to: 'sessions#create'
  delete  '/logout',       to: 'sessions#destroy'

  get     '/profile',      to: 'users#show'
  get     '/signup',       to: 'users#new'
  post    '/signup',       to: 'users#create'

  patch   '/attend',       to: 'users#attend_event'
  delete  '/not_attend',   to: 'users#not_attend_event' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
