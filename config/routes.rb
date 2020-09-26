Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' }

  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  get 'about' => 'posts#about'
  resources :users
  resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :photos, only: %i(create)
    resources :likes, omly: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end

  resources :questions, only: %i(new create index show destroy) do
    resources :qphotos, only: %i(create)
    resources :answers, only: %i(create destroy)
  end
end
