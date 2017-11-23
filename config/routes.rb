

Rails.application.routes.draw do


  resources :answercomments
  resources :questions do
  	  resources :answers do
  	  	  resources :answer_comments
  	  	end
  	end
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    root 'home#index'
  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

