Rails.application.routes.draw do
  get 'deductibles/index', to: 'deductibles#index'
  get 'deductibles/show', to: 'deductibles#show'
  get 'deductibles/create', to: 'deductibles#create'
  get 'deductibles/destroy', to: 'deductibles#destroy'
  get 'categories/index', to: 'categories#index'
  get 'categories/show', to: 'categories#show'
  get 'categories/create', to: 'categories#create'
  get 'categories/destroy', to: 'categories#destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
