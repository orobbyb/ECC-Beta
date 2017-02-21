Rails.application.routes.draw do
  
  get '/search' => 'search#search'
  get 'admin' => 'admin#index'

  #Start single document routs
  get 'ecodes/:category/:org/:id' => 'documents#show', :as => :document
  get 'ecodes/:category/:org/:id/edit'=> 'documents#edit', :as => :edit_document
  patch 'ecodes/:category/:org/:id' => 'documents#update'
  get '/documents/new', to: 'docuemets#new'
  post '/documents', to: 'documents#create'
  delete 'ecodes/:category/:org/:id' => 'documents#destroy'
  #End single Document Routes
  resources :documents
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'logout' => 'sessions#destroy'
  resources :users

  #Start Static Page Routes
  get '/' => 'static#home'
  get '/about' => 'static#about'
  #End Static Page Routes
end
