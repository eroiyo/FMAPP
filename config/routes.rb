Rails.application.routes.draw do
  root to: 'categories#index'
  get 'deductibles', to: 'deductibles#index'
  get 'deductibles/:id', to: 'deductibles#show'
  post 'deductibles/:id/destroy', to: 'deductibles#destroy'
  get 'deductibles/creation', to: 'deductibles#creation'
  post 'deductibles/create', to: 'deductibles#create'
  get 'categories/:id', to: 'categories#show'
  get 'categories/creation', to: 'categories#creation'
  post 'categories/create', to: 'categories#create'
  post 'categories/:id/destroy', to: 'categories#destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
