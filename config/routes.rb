Cs638OrgOrganizer::Application.routes.draw do


  resources :inventoryitems

  devise_for :users

  resources :events

  resources :duties
  match 'duties/assign/:id' => 'duties#assign', :as => :assign_duty
  match 'duties/assignment/:id' => 'duties#assignment', :as => :assignment_duty

  resources :positions
  match 'admin/positions/:id/assigned' => 'admin/positions#assigned', :as => :assigned_admin_position
  match 'admin/positions/:id/assign' => 'admin/positions#assign', :as => :assign_admin_position
  match "profile" => "users#show"
  match "users"   => redirect("/profile")
  resources :users
  match '/change_password' => 'users#change_password', :as => :change_password
  match '/change_password_update' => 'users#change_password_update', :as => :change_password_update
  resources :users, :controller => 'users', :collection => {:change_password_update => :put}

  resources :settings
  namespace :admin do 
      resources :admin
      resources :users
      resources :positions
       
      resources :home
    
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'events#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
