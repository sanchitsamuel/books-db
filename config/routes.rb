Rails.application.routes.draw do
  resources :books do
    get :total_price, on: :collection
    post :create_list, on: :collection
  end

  namespace :api do
    resources :books, only: [:index] do
      post :create_list, on: :collection
      get :total_price, on: :collection
      get :psql_function, on: :collection
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
