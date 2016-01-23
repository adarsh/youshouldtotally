Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    resource :relationship, only: [:create, :destroy]
  end

  resources :television_shows, only: [:create]

  root "homes#show"
end
