Rails.application.routes.draw do
  resources :gossips do
    resources :comments
    resources :gossip_likes, only: [:new, :create, :destroy]
  end
  root to: 'gossips#index'
  resources :sessions, only:[:new, :create, :destroy]
  resources :users, only: [:show,:create,:new]
  resources :cities, only: [:show]
  get 'team', to: 'front#team'
  get 'contact', to: 'front#contact'
  get 'welcome/:first_name', to: 'front#welcome'
end
