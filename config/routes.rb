TodoApp::Application.routes.draw do
  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :task_lists, only: [:create, :destroy]
  resources :task_list_users, only: [:create, :destroy]
  resources :tasks, only: [:new, :create, :destroy, :edit]

  root :to => "pages#home"
  get "/calendar" => "pages#calendar", :as => "calendar"
  get "/signup" => "users#new", :as => "signup"
  get "/login" => "sessions#new", :as => "login"
  delete "/logout" => "sessions#destroy", :as => "logout"
  post "/share" => "task_list_users#share", :as => "share"
  delete "/remove_list" => "task_lists#remove", :as => "remove_list"
  get "/profile" => "users#show", :as => "profile"
  post "/task_toggle" => "tasks#toggle", :as => "task_toggle"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
