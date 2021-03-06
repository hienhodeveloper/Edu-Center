Rails.application.routes.draw do
  resources :courses do 
    get 'subcribe_course', on: :member
    delete 'unsubcribe_course', on: :member
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations:'users/registrations',}
  get 'about/index'
  get 'login/index'
  get 'home/index'
  get 'welcome/index'

  namespace :manage_users do
    get 'all', action: :index
    get 'user/:id', action: :show
    post 'update_per', action: :update_per
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :two_factor_settings, except: [:index, :show]

  root 'home#index'
end
