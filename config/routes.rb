

Rails.application.routes.draw do
  resources :permisos
  resources :facultads
  match '/users', to: 'users#Index', via: 'get'
  match '/users/show/:id', to: 'users#show', via: 'get'


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
    resources :users, :only => [:show]
    root 'home#index'
  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

