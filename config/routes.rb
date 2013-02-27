CommunityForum::Application.routes.draw do
  resources :users
  resources :sessions,  only: [:new, :create, :destroy]
  resources :boards,    only: :show do
    resources :topics,  except: :index
  end

  root to: 'categories#index'

  get    '/signup'     => 'users#new'
  get    '/signin'     => 'sessions#new'
  delete '/signout'    => 'sessions#destroy'
  get    '/boards/:id' => 'topics#show', as: :topic
end
