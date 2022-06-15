Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations', 
                                    sessions: 'users/sessions',
                                    passwords: 'users/passwords' 
                                  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end

  root to: 'home#top'

  resources :users, only: %i[show] do
    member do
      get 'profile'
      get 'community'
    end
  end

  resources :tasks do
    resources :student_audios
  end
  resources :relationships, only: %i[create destroy connect]


end
