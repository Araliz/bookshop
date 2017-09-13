Rails.application.routes.draw do

  resource :cart, controller: "cart", only: [:show, :update, :edit] do
    member do
      post :add_book
      post :remove_book
      get :confirmation
      post :finish
    end
  end
  namespace :admin do
    resources :books
    resources :orders, only: [:index, :show, :update]
  end
  devise_for :users
  root 'books#index'
  get "about" => 'home#about'
  get "contact" => 'home#contact'
  get "index" => 'home#index'
  resources :users, only: [:show] do
    resources :addresses, except: [:index, :show, :destroy]
    member do
      get :orders
      get 'orders/:order_id', to: 'users#order_show', as: 'order'
    end
  end
  resources :books, only: [:show, :index] do
    collection do
      match 'search' => 'books#search', via: [:get, :post], as: :search
    end
  end
  resources :categories, only: [:show]
  resources :reviews, only: [:create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
