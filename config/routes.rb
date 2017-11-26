

Rails.application.routes.draw do
  
  resources :questioncomments
  resources :questions do
      post 'sumar_puntaje'
      resources :questioncomments
  	  resources :answers do
  	  		resources :answercomments
  	  	end

  	end
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    root 'home#index'
  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

