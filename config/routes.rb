Rails.application.routes.draw do
  resources :recipes_foods
  resources :foods
  devise_for :users
  root to:"recipes#index"
  resources :recipes do
    collection do
      get 'search'
    end
  end
  get 'recipes/search'
  resources :users, only: [:show, :edit, :update]
end
