Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#index'
    resources :sweet_products, only: %i[index show]
    resources :categories, only: %i[index show]
  end

  get :search, to: 'pages#search'
  devise_for :admin_users, ActiveAdmin::Devise.config
  get '/admin/sweet_products/import', to: 'admin/sweet_products#import'
  post '/admin/sweet_products/import', to: 'admin/sweet_products#import_file'
  ActiveAdmin.routes(self)
  resource :call_me, only: [:create], controller: :call_me
end
