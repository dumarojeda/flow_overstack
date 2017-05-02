Rails.application.routes.draw do
  root "questions#index"

  resources :questions do
    resources :comments, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy]
    resources :votes, only: [:create, :destroy]
  end

  resources :answers do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
