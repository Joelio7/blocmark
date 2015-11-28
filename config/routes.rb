Rails.application.routes.draw do

root to: 'welcome#index'
get "welcome/index" =>  'welcome#index'
  devise_for :users
  resources :users, only: [:show]
  resources :topics do
    resources :bookmarks
  end

end
