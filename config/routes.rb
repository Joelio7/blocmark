Rails.application.routes.draw do

root to: 'welcome#index'
get "welcome/index" =>  'welcome#index'
  devise_for :users
  resources :users, only: [:show]
  resources :topics do
    resources :bookmarks, except: [:index] 
  end
  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

end
