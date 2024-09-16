Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :edit]
  get 'about' => 'homes#about'
end
