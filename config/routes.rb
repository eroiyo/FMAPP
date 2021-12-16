Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'categories/create', to: 'categories#creation'
  post 'categories/create', to: 'categories#create'
  get 'deductibles/create', to: 'deductibles#creation'
  post 'deductibles/create', to: 'deductibles#create'
  get 'deductibles', to: 'deductibles#index'
  get 'deductibles/:id', to: 'deductibles#show'
  post 'deductibles/:id/destroy', to: 'deductibles#destroy'
  get 'categories/', to: 'categories#index'
  get 'categories/:id', to: 'categories#show'
  post 'categories/:id/destroy', to: 'categories#destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
