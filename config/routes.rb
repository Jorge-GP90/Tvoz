Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions' }
    root "home#top"

    resources :tasks
 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
