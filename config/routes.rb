

Rails.application.routes.draw do

  resources :questions do
  	  resources :answers
  	end
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    root 'home#index'
  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

