Rails.application.routes.draw do
  resources :users, only: [:update]
  devise_for :users, controllers: {
   sessions: 'users/sessions',
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }

get 'admin', to: "admin#index"
 #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root 'home#index'
end
