Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  root 'home#index'

  match "/clients/:id" => "home#client", :via => [:get], as: 'client'
  match "/clients/:id" => "home#edit_client", :via => [:patch, :put]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #logout
  match '/admin_logout' => 'home#admin_logout', via: [:get, :post]

  #new client
  match '/create_client' => 'home#create_client', via: [:get, :post]
end
