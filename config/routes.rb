Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :posts
  resources :contacts, only: [:new, :create]
  get 'welcome/index'
  root 'welcome#index'

  get '*path' => redirect('/')
  # chuyển tất cả các url không tồn tại quay về root
end
