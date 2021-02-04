Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'step1', to: 'users/registrations#new_address'
    get 'step2', to: 'users/registrations#create_address'
    get 'step3', to: 'users/registrations#new_card'
    post 'step4', to: 'users/registrations#create_card'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    collection do
      get 'tag'
      get 'search'
    end
  end

  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end
