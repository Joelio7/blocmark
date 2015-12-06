Rails.application.routes.draw do

root to: 'welcome#index'
get "welcome/index" =>  'welcome#index'
  devise_for :users
  resources :users, only: [:show] do
  end
  resources :topics do
    resources :bookmarks, except: [:index]
  end
  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end
  resources :incoming, only: [:create]

  #Incoming mail Controller
  post :incoming, to: "incoming#create"
end
