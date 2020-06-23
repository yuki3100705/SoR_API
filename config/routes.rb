Rails.application.routes.draw do
  resources :users

  post 'auth' => 'login#auth'
  post 'login/auth' => 'login#auth'
  post 'login/desdes/:id' => 'login#desdes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
