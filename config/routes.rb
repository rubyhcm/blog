# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :posts
  resources :contacts, only: %i[new create]
  get 'welcome/index'
  root 'welcome#index'

  # get '*path' => redirect('/')
  # chuyển tất cả các url không tồn tại quay về root
  namespace :api do
    namespace :v1 do
      get 'welcome/index'
      resources :projects
      resources :contacts, only: %i[new create]
    end
  end
end
