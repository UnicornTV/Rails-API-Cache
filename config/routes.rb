Manticore::Application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/api' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :tweets, defaults: { resource: 'Tweet' }
    end
  end

  authenticated :user do
    root to: 'static#home', as: :authenticated_root
  end

  unauthenticated do
    root to: 'static#home'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users

  resources :posts, defaults: { resource: 'Post' } do
    collection { get :manage }
  end

  resources :tweets, defaults: { resource: 'Tweet' } do
    collection {
      get :manage
      get :data
    }
  end

  post 'settings', to: 'api#settings'
  get 'stream', to: 'api#stream'
  get 'static/home'
end
