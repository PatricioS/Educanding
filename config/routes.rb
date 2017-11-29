

Rails.application.routes.draw do
  resources :tags
  resources :tabs
  resources :etiqueta
  resources :questions do
      post 'sumar_puntaje'
      post 'restar_puntaje'
      resources :questioncomments do
        post 'sumar_puntaje'
        post 'restar_puntaje'
      end
  	  resources :answers do
          post'sumar_puntaje'
          post 'restar_puntaje'
  	  		resources :answercomments do 
            post'sumar_puntaje'
            post 'restar_puntaje'
          end
  	  	end

  	end
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    root 'home#index'
  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

