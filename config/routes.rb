Rails.application.routes.draw do
  resources :users
  get 'about/index'
  get 'login/index'
  get 'home/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
