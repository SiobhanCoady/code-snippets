Rails.application.routes.draw do
  resources :snippets, shallow: true do
    resources :kinds, only: [:show]
  end
  resources :users, only: [:new, :create]

  root 'snippets#index'
end
