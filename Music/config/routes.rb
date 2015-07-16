Rails.application.routes.draw do

  resources :albums
  resources :tracks
  resources :bands
  resources :users, only:[:create, :new, :show]
  resources :session, only:[:create, :new, :destroy]
  resources :bands do
    resources :albums, only:[:new]
    resources :tracks, only:[:new]
  end
  resources :albums, except:[:new, :index]
  resources :tracks, except:[:new, :index]



  root :to => "users#index"
end
