Rails.application.routes.draw do
  #mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => redirect('/admin')
  mount_devise_token_auth_for 'User', at: 'api/auth', format: 'json'
  namespace :api, defaults: {format: 'json'} do
    resources :investors do
      resources :investments, only: [:index]
    end
    resources :investments
    resources :contracts do
      resources :expenses, only: [:index]
    end
    resources :expenses
  end
end
