Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :comments
  resources :users do 
  	resources :books do
    #users/:id/book_comments
    #book_comments
    #book_comments.html.erb
    end
  end
  get 'users/:id/book_comments' => 'books#book_comments'
  #resources :bookgenres
  get 'genres/most_popular' => 'genres#most_popular'
  resources :genres
  root 'books#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
