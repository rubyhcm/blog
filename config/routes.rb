# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :posts
  resources :contacts, only: %i[new create]
  get 'welcome/index'
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :projects, defaults: { format: :json }
      resources :posts, defaults: { format: :json }
      resources :contacts, only: :create, defaults: { format: :json }
    end
  end

  get '*path' => redirect('/')
  # chuyển tất cả các url không tồn tại quay về root
end
