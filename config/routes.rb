Rails.application.routes.draw do
  resources :assignments

  resources :users

  resources :notifications

  resources :promotions

  resources :trials

  resources :tenants

  resources :trial_alerts


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'sessions#new'
   match '/trials_expire', to: 'trials#expire', via: 'get'
   match '/trials_all', to: 'trials#all',  via: 'get'
   match '/trials_non_expire', to: 'trials#non_expire',  via: 'get'
   match '/trials_search', to: 'trials#search',  via: 'get'
   match '/trials_calendar', to: 'trials#calendar',  via: 'get'
   match '/trials_assigned', to: 'trials#assigned_trials',  via: 'get'

   match '/dashboard', to: 'dashboards#index', via:'get'

   match '/users_all', to: 'users#all',  via: 'get'

   get    'login'   => 'sessions#new'
   post   'login'   => 'sessions#create'
   delete 'logout'  => 'sessions#destroy'
   delete '/trials_alert/:id', to: 'trial_alerts#destroy', as: 'trial_alert_delete'
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
