Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root 'discover#index'


  resources :places
  resources :moods
  resources :searches

  resources :categories
  #get 'categories/:id/edit' => 'categories#edit', as: :edit_category
  #patch 'categories/:id' => 'categories#update'
  #get 'categories/:id' => 'categories#show', as: :category 
  

  get 'discover/traveling' => 'discover#traveling', as: :traveling
  get 'discover/:id/share' => 'discover#share', as: :share
  get 'discover/:id/directions' => 'discover#directions', as: :directions

  resources :discover

  # need to get this to work
  
  # get 'discover/:id/directions' => 'discover#get_directions', as: :directions

  get '/login', to: 'discover#index', as: :sessions
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :log_out


  ########################
  # USERS RESOURCE
  ########################
  get 'users/' => 'users#index'
  # get 'users/change-location' => 'users#change-location'

  post 'users/' => 'users#create'
  delete 'users/:id' => 'users#destroy'

  get 'signup/' => 'users#new', as: :signup
  get 'users/new' => 'users#new'

  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'

  get 'users/:id' => 'users#show', as: :user 

  get '/about' => 'pages#about', as: :about


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
