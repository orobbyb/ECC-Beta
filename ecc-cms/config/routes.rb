Rails.application.routes.draw do
  
  
  get '/search' => 'search#search'
  get 'admin' => 'admin#index'
  get 'users/:id/delete' => 'users#destroy', :as => :delete_user
  #Start single document routs
  get 'ecodes/:org/:id' => 'documents#show', :as => :show_document
  get 'ecodes/:org/:id/edit'=> 'documents#edit', :as => :edit_document
  patch 'ecodes/:org/:id' => 'documents#update'
  get '/documents/new', to: 'documents#new'
  post '/documents', to: 'documents#create'
  get 'ecodes/:org/:id/delete' => 'documents#destroy', :as => :delete_document
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
