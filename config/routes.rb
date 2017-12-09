

Rails.application.routes.draw do
  get 'search/create'

  resources :permisos
  resources :facultads do
     post 'cambiar_orden'
  end
  match '/users', to: 'users#Index', via: 'get'
  match '/users/show/:id', to: 'users#show', via: 'get'


  resources :tags
  resources :etiqueta
  resources :questions do
      post 'cambiar_orden'
      post 'sumar_puntaje'
      post 'restar_puntaje'
      resources :questioncomments do
        post 'sumar_puntaje'
        post 'restar_puntaje'
      end
  	  resources :answers do
          post 'mejor_respuesta'
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
      registrations: 'users/registrations',
      #passwords: 'users/passwords'

    }
    resources :users, :only => [:show]
    resources :users, :only => [:edit] do
      collection do
        patch 'update_password'
      end
    end
    root 'home#index'
  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

