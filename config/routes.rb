Rails.application.routes.draw do
  get 'about/index'
  get 'sign_up/index'
  get 'login/index'
  get 'home/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :home do 
    
  end

  root 'home#index'
end
