Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }

root 'posts#index'

resources :users
resources :posts, only: %i(new create index show destroy) do
resources :photos, only: %i(create)
resources :likes, omly: %i(create destroy)
resources :comments, only: %i(create destroy)
end
resources :questions, only: %i(new create index show destroy)do
resources :qphotos, only: %i(create)
end
end
