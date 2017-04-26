Rails.application.routes.draw do
  resources :snippets, shallow: true do
    resources :kinds, only: [:show]
  end
  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root 'snippets#index'
end
