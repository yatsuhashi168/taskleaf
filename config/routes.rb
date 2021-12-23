Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'
  resources :tasks do
    post 'confirm', action: :confirm_new, on: :new
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
