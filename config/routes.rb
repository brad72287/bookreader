Rails.application.routes.draw do
  resources :bookgenres
  resources :genres
  resources :books
  root 'books#epub'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
